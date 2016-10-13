class AddHeightToExternalGraph < ActiveRecord::Migration
  def change
    add_column :external_graphs, :height, :integer, default: 400;
  end

  ExternalGraph.find_each do |graph|
    graph.height = 400
    graph.save
  end
end
