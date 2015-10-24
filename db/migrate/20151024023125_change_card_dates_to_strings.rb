class ChangeCardDatesToStrings < ActiveRecord::Migration
  def change
    add_column :cards, :goal_date_string, :string
    add_column :cards, :value_date_string, :string
    Card.all.each do |c|
      c.goal_date_string = c.goal_date.to_s
      c.value_date_string = c.value_date.to_s
      c.save!
    end
    remove_column :cards, :goal_date, :date
    remove_column :cards, :value_date, :date
    rename_column :cards, :goal_date_string, :goal_date
    rename_column :cards, :value_date_string, :value_date
  end
end
