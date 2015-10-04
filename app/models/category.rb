class Category < ActiveRecord::Base
  belongs_to :admin
  has_many :pages

  def self.options_for_select
    all.map { |category| [category.name, category.id] }
  end

  def created_by
    admin.email
  end
end
