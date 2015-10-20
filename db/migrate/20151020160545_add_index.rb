class AddIndex < ActiveRecord::Migration
  def change
    add_index :cards, :page_id
    add_index :external_graphs, :page_id
    add_index :graphs, :page_id
    add_index :lines, :graph_id
    add_index :points, :line_id
  end
end
