class CreateCategory < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :order
      t.integer :admin_id
      t.timestamps
    end
  end
end
