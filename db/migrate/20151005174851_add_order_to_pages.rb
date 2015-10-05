class AddOrderToPages < ActiveRecord::Migration
  def change
    remove_column :pages, :title, :string
  end
end
