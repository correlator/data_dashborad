class CreateTagStuff < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
    end
    add_index :tags, :name, unique: true

    create_table :tag_joins do |t|
      t.integer :tag_id
      t.integer :taggable_id
      t.integer :taggable_type
    end
    add_index :tag_joins, [:taggable_id, :taggable_type]
  end
end
