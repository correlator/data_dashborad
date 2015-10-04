class Category < ActiveRecord::Base
  belongs_to :admin

  def created_by
    admin
  end
end
