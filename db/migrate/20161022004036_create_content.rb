class CreateContent < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.integer :page_id
      t.string :content_type
      t.integer :content_id
      t.integer :order

      t.timestamps
    end

    Graph.find_each do |graph|
      Content.where(page_id: graph.page_id, content_type: 'Graph', content_id: graph.id)
             .first_or_create
    end

    ExternalGraph.find_each do |external_graph|
      Content.where(page_id: external_graph.page_id, content_type: 'ExternalGraph', content_id: external_graph.id)
             .first_or_create
    end

    Card.find_each do |card|
      Content.where(page_id: card.page_id, content_type: 'Card', content_id: card.id)
             .first_or_create
    end
  end
end
