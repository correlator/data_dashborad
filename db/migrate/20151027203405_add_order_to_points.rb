class AddOrderToPoints < ActiveRecord::Migration
  def change
    add_column :points, :time_string, :string
    add_column :points, :position, :integer
    Point.all.each do |p|
      p.time_string = p.time.to_s
      p.save
    end
    remove_column :points, :time, :date
    rename_column :points, :time_string, :time
  end
end
