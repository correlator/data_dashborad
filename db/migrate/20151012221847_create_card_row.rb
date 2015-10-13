class CreateCardRow < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :title
      t.string :color
      t.string :goal
      t.string :value
      t.date :goal_date
      t.date :value_date
      t.string :source
      t.string :trend
      t.string :icon
      t.integer :order
      t.integer :page_id

      t.integer :admin_id
      t.timestamps
    end
  end
end
