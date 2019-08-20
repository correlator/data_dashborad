class AddSourceToCard < ActiveRecord::Migration
  def change
    add_column :cards, :source_name, :string, default: "Source"
  end
end
