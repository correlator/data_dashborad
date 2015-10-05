class Graph < ActiveRecord::Base
  validates :title, uniqueness: true
  has_many :lines
  after_create :set_lines
  belongs_to :page

  def data
    data = {}
    lines.each do |line|
      data[line.title] = {
        times: line.times,
        values: line.values,
        unit: unit
      }
    end
    data
  end

  private

  def set_lines
    self.lines = [Line.create(title: 'Goal'), Line.create(title: 'Data')]
  end
end
