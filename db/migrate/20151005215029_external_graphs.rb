class ExternalGraphs < ActiveRecord::Migration
  def change
    create_table :external_graphs do |t|
      t.integer :admin_id
      t.integer :page_id
      t.integer :order
      t.string :title
      t.string :external_url

      t.timestamps
    end
  end
end
