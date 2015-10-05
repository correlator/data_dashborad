class Admin::PagesController < AdminController
  def index
    @pages = Page.all
    @page = Page.new
  end

  def create
    @page = Page.create(page_params)
    redirect_to admin_pages_path
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

  private

  def page_params
    params.require(:page)
          .permit(:order, :name, :title, :intro_text, :category_id, :admin_id)
  end
end