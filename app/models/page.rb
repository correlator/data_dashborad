class Page < ActiveRecord::Base
  belongs_to :category
  belongs_to :admin
  has_many :graphs

  def self.options_for_select
    all.map { |page| [page.name, page.id] }
  end

  def self.options_for_best_in_place
    all.map { |page| [page.id, page.name] }
  end

  def created_by
    admin.email
  end
end
