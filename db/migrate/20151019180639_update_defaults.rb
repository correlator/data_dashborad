class UpdateDefaults < ActiveRecord::Migration
  def change
    add_column(:graphs, :created_at, :datetime)
    add_column(:graphs, :updated_at, :datetime)
    add_column(:graphs, :admin_id, :integer)

    change_column_default(:categories, :order, nil)
    change_column_default(:external_graphs, :order, nil)
    change_column_default(:graphs, :order, nil)
    change_column_default(:pages, :order, nil)
  end
end
