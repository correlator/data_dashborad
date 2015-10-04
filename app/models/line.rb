class Line < ActiveRecord::Base
  has_many :points
  belongs_to :graph

  def times
    points.order(:time).map(&:time)
  end

  def values
    points.order(:time).map(&:value)
  end
end
