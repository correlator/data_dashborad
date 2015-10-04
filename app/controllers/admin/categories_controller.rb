class Admin::CategoriesController < AdminController
  def index
    @categories = Category.all.order(:order)
  end
end
