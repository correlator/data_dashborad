class AddHeightToExternalGraph < ActiveRecord::Migration
  def change
    add_column :external_graphs, :height, :integer, default: 400;
  end
end
