class AddCardIdToLine < ActiveRecord::Migration
  def change
    add_column :lines, :card_id, :integer
    add_column :points, :point_date, :date

    Card.find_each do |card|
      line = Line.create(card_id: card.id)
      line.points.create(value: card.value, point_date: card.updated_at)
    end
  end
end
