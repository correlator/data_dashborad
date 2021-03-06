class ExternalGraph < ActiveRecord::Base
  include PgSearch
  validates :title, uniqueness: true
  validates :width, :inclusion => { :in => [12, 6, 4, 3] }
  belongs_to :admin
  has_many :contents
  has_many :pages, through: :contents
  has_many :tag_joins, as: :taggable
  has_many :tags, through: :tag_joins

  multisearchable :against => [:title, :admin_email]

  def admin_email
    admin.email if admin
  end

  def pages
    Content.where(content_id: id, content_type: 'ExternalGraph').map(&:page)
  end

  def to_search_result
    {
      id: id,
      class: 'ExternalGraph',
      title: title,
      admin: admin.try(:email),
      icon: 'code'
    }
    end

  def created_by
    admin.email if admin
  end
end
