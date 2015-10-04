class CreateGraph < ActiveRecord::Migration
  def change
    create_table :graphs do |t|
      t.string :title
    end

    create_table :lines do |t|
      t.string :title
      t.string :unit
      t.integer :graph_id
    end

    create_table :points do |t|
      t.float :value
      t.date :time
      t.text :notes
      t.integer :line_id
      t.integer :admin_id

      t.timestamps
    end
    add_index :graphs, :title, :unique => true
  end
end
