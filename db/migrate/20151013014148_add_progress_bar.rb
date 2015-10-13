class AddProgressBar < ActiveRecord::Migration
  def change
    add_column :cards, :percentage_complete, :integer,  default: 0
  end
end
