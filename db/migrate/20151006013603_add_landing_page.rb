class AddLandingPage < ActiveRecord::Migration
  def change
    add_column :categories, :hidden, :boolean
    add_column :pages, :landing_page, :boolean
  end
end
