class Point < ActiveRecord::Base
  belongs_to :line
  belongs_to :admin
  default_scope { order(:time) }

  def created_by
    admin.email if admin
  end
end
