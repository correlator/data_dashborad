class MoveUnitsToGraph < ActiveRecord::Migration
  def change
    remove_column :lines, :unit, :string
    add_column :graphs, :unit, :string
    add_column :graphs, :page_id, :integer
    add_column :graphs, :order, :integer
  end
end
