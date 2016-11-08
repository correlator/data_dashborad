class Page < ActiveRecord::Base
  belongs_to :category
  belongs_to :admin
  has_many :contents
  has_many :graphs, through: :contents, source: :content, :source_type => 'Graph'
  has_many :external_graphs, through: :contents, source: :content, :source_type => 'ExternalGraph'
  has_many :cards, through: :contents, source: :content, :source_type => 'Card'

  validates_uniqueness_of :landing_page, :if => :landing_page
  default_scope { order(:order) }

  def created_by
    admin.email if admin
  end

end
