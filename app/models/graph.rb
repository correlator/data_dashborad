class Graph < ActiveRecord::Base
  include PgSearch
  validates :title, uniqueness: true
  validates :width, :inclusion => { :in => [12, 6, 4, 3] }
  validates :style, :inclusion => { :in => ['spline', 'bar'] }
  has_many :lines
  after_create :set_lines
  belongs_to :page
  belongs_to :admin
  has_many :contents
  has_many :pages, through: :contents

  multisearchable :against => [:title, :admin_email]

  def admin_email
    admin.email
  end

  def pages
    Content.where(content_id: id, content_type: 'Graph').map(&:page)
  end

  def to_search_result
    {
      id: id,
      class: 'Graph',
      title: title,
      admin: admin.try(:email),
      icon: 'line-chart'
    }
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
