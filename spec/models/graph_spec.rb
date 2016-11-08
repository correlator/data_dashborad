require 'rails_helper'

describe Category, type: :model do
  let(:admin) { FactoryGirl.create(:admin) }
  let!(:graph) { Graph.create(title: 'Sweet new graph', admin_id: admin.id) }

  context 'validations' do
    it 'should require titles to be unique' do
      graph2 = Graph.new(title: 'Sweet new graph')
      expect(graph2.valid?).to eq false
    end
  end

  context 'lines' do
    let!(:data_line) { graph.lines.create(title: 'Data')}
    let!(:goal_line) { graph.lines.create(title: 'Goal')}
    it 'should be able to have many lines' do
      expect(graph.lines.count).to eq 4
    end
  end

  context 'creation' do
    it 'should start with 2 lines' do
      new_graph = admin.graphs.create(title: 'new_graph')
      expect(new_graph.lines.pluck(:title)).to match_array ['Goal', 'Data']
    end
  end

  context 'scopes' do
    let(:page) { FactoryGirl.create(:page)}
    let!(:owned_graph) { admin.graphs.create(title: 'Graphy', page_id: page.id) }
    it 'should find the orphaned graphs' do
      expect(Graph.orphaned).to eq [graph]
    end
  end


  context 'data' do
    before do
      line_goal.points = [goal_point1, goal_point2, goal_point3]
      line_data.points = [data_point2, data_point1]
      graph.lines = [line_goal, line_data]
    end

    let(:goal_point3) { Point.create(time: Date.new(2015, 1, 3), value: 3) }
    let(:goal_point2) { Point.create(time: Date.new(2015, 1, 2), value: 2) }
    let(:goal_point1) { Point.create(time: Date.new(2015, 1, 1), value: 1) }
    let(:data_point1) { Point.create(time: Date.new(2015, 1, 1), value: 2) }
    let(:data_point2) { Point.create(time: Date.new(2015, 1, 2), value: 0) }

    let(:line_goal) { Line.create(title: 'Goal') }
    let(:line_data) { Line.create(title: 'Data') }
    let(:graph) { admin.graphs.create(title: 'Text Graph', unit: 'Calls') }

    it 'should know its data' do
      expect(graph.data).to match_array(
        [goal_point1, goal_point2, goal_point3, data_point1, data_point2].map do |point|
          {
            'dateField' => point.time,
            'line' => point.line.title,
            'style' => 'spline',
            point.line.title => point.value
          }
        end
      )
    end
  end
end
