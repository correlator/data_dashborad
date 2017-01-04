class Tag < ActiveRecord::Base
  has_many :tag_joins
  has_many :cards, through: :tag_joins, source: :taggable, source_type: 'Card'
  has_many :external_graphs, through: :tag_joins, source: :taggable, source_type: 'ExternalGraph'

  def content
    cards + external_graphs
  end
end
