class Point < ActiveRecord::Base
  belongs_to :line
  belongs_to :admin

  def created_by
    admin.email
  end
end
