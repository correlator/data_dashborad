class Admin::PagesController < AdminController
  def index
    @pages = Page.all
    @page = Page.new
  end

  def edit
    @page = Page.find(params[:id])
  end

  def create
    @page = Page.create(page_params)
    redirect_to admin_pages_path
  end

  def update
    @page = Page.find(params[:id])
    if @page.update(page_params)
      redirect_to admin_pages_path
    else
      render :edit
    end
  end

  private

  def page_params
    params.require(:page)
          .permit(:name, :title, :intro_text, :category_id, :admin_id)
  end
end
