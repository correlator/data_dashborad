class Admin::CategoriesController < AdminController
  def index
    @categories = Category.all.order(:order)
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    redirect_to admin_categories_path
  end

  def update
    @category = Category.find(params[:id])
    respond_to do |format|
      if @category.update(category_params)
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


  private

  def category_params
    ps = params.require(:category).permit(:name, :order)
    ps[:admin_id] = current_admin.id
    ps
  end
end
