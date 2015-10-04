class Admin::CategoriesController < AdminController
  def index
    @categories = Category.all.order(:order)
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :order, :admin_id)
  end
end
