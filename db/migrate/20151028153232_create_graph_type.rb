class CreateGraphType < ActiveRecord::Migration
  def change
    add_column :graphs, :style, :string, default: 'spline'
  end
end
