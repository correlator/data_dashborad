class Graph < ActiveRecord::Base
  validates :title, uniqueness: true
  has_many :lines
  after_create :set_lines
  belongs_to :page

  def data
    data = []
    lines.each do |line|
      line.points.each do |point|
        data << { 'dateField' => point.time,
                  'line' => line.title,
                  line.title => point.value }
      end
    end
    data
  end

  private

  def set_lines
    self.lines = [Line.create(title: 'Goal'), Line.create(title: 'Data')]
  end
end
