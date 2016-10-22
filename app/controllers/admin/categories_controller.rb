class Admin::CategoriesController < AdminController
  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    respond_to do |format|
      format.js
      format.html { redirect_to admin_categories_path }
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    respond_to do |format|
      if update_category
        format.json { render json: @category }
      else
         format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if current_admin.super_admin
      Category.find_by(id: params[:id]).destroy
    end
    redirect_to admin_categories_path
  end

  def reorder
    params[:category_ids].each_with_index do |category_id, index|
      Category.where(id: category_id).update_all(order: index)
    end
    respond_to do |format|
      format.json { render json: true }
    end
  end

  private

  def category_params
    ps = params.require(:category).permit(:name, :order, :pages => [])
    ps[:pages] = ps[:pages].map { |page_id| Page.find(page_id) } if ps[:pages]
    ps[:admin_id] = current_admin.id
    ps
  end

  def update_category
    @category.update(category_params)
    update_pages if category_params[:pages]
    true
  end

  def update_pages
    @category.pages.update_all(category_id: 0, order: -1)
    category_params[:pages].each_with_index do |page, i|
      page.update(order: i, category_id: @category.id)
    end

    @category.pages.where(order: -1).update_all(category_id: 0)
  end
end
