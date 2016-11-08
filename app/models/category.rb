class Category < ActiveRecord::Base
  belongs_to :admin
  has_many :pages
  default_scope { order(:order) }

  def created_by
    admin.email if admin
  end
end
