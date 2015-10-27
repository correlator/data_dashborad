class AddWidthColumnToExternal < ActiveRecord::Migration
  def change
    add_column :external_graphs, :width, :integer, default: 12
    add_column :graphs, :width, :integer, default: 12
  end
end
