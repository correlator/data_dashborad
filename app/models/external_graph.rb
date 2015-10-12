class ExternalGraph < ActiveRecord::Base
  validates :title, uniqueness: true
  belongs_to :page
  scope :orphaned, -> do
    where("page_id not in (#{Page.pluck(:id).join(',')}) OR page_id IS NULL")
  end
end
