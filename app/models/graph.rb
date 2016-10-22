class Graph < ActiveRecord::Base
  validates :title, uniqueness: true
  validates :width, :inclusion => { :in => [12, 6, 4, 3] }
  validates :style, :inclusion => { :in => ['spline', 'bar'] }
  has_many :lines
  after_create :set_lines
  belongs_to :page
  belongs_to :admin
  has_many :contents
  has_many :pages, through: :contents


  scope :orphaned, -> do
    where("page_id not in (#{Page.pluck(:id).join(',')}) OR page_id IS NULL")
  end

  def data
    data = []
    lines.each do |line|
      line.points.each do |point|
        data << { 'dateField' => point.time,
                  'line' => line.title,
                  'style' => style,
                  line.title => point.value }
      end
    end
    data
  end

  def line_data
    lines.map do |line|
      {
        'title' => line.title,
        'style' => style,
      }
    end
  end

  def created_by
    admin.email if admin
  end

  private

  def set_lines
    self.lines = [Line.create(title: 'Goal'), Line.create(title: 'Data')]
  end
end
