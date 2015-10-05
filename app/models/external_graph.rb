class ExternalGraph < ActiveRecord::Base
  validates :title, uniqueness: true
  belongs_to :page
end
