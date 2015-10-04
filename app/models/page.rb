class Page < ActiveRecord::Base
  belongs_to :category
  belongs_to :admin

  def created_by
    admin.email
  end
end
