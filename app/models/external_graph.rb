class ExternalGraph < ActiveRecord::Base
  validates :title, uniqueness: true
  validates :width, :inclusion => { :in => [12, 6, 4, 3] }
  belongs_to :page
  belongs_to :admin
  scope :orphaned, -> do
    where("page_id not in (#{Page.pluck(:id).join(',')}) OR page_id IS NULL")
  end

  def created_by
    admin.email if admin
  end
end
