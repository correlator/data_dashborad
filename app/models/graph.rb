class Graph < ActiveRecord::Base
  validates :title, uniqueness: true
  has_many :lines

  def data
    data = {}
    lines.each do |line|
      data[line.title] = {
        times: line.times,
        values: line.values,
        unit: line.unit
      }
    end
    data
  end
end
