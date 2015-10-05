class Page < ActiveRecord::Base
  belongs_to :category
  belongs_to :admin
  has_many :graphs
  has_many :external_graphs

  def self.options_for_select
    all.map { |page| [page.name, page.id] }
  end

  def self.options_for_best_in_place
    all.map { |page| [page.id, page.name] }
  end

  def created_by
    admin.email if admin
  end

  def contents
    (graphs + external_graphs).sort_by(&:order)
  end
end
