class Admin::PagesController < AdminController
  def index
    @pages = Page.all
    @page = Page.new
  end

  def create
    @page = Page.create(page_params)
    redirect_to admin_pages_path
  end

  private

  def page_params
    params.require(:page)
          .permit(:name, :title, :intro_text, :category_id, :admin_id)
  end
end
