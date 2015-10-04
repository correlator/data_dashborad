class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :title
      t.text :intro_text
      t.integer :category_id
      t.integer :admin_id
      t.integer :order

      t.timestamps
    end
  end
end
