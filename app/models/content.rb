class Content < ActiveRecord::Base
  belongs_to :page
  belongs_to :content, polymorphic: true
  default_scope { order(:order) }
end
