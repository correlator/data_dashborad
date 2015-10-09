class Admin::PagesController < AdminController
  def index
    @pages = @category.pages
    @page = Page.new
  end

  def show
    @page = Page.find(params[:id])
  end

  def create
    @page = Page.create(page_params)
    render :show
  end

  def update
    @page = Page.find(params[:id])
    respond_to do |format|
      if @page.update(page_params)
        format.json { render json: @page }
      else
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @page = Page.find_by(id: params[:id])
    if current_admin.super_admin
      @page.destroy
    end
    redirect_to admin_category_pages(@page.category)
  end

  private

  def page_params
    ps = params.require(:page)
               .permit(:order, :name, :intro_text, :category_id)
    ps[:admin_id] = current_admin.id
    ps
  end
end
