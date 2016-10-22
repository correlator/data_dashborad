class Content < ActiveRecord::Base
  belongs_to :page
  belongs_to :content, polymorphic: true
end
