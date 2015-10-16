class Admin::PagesController < AdminController
  def index
    @pages = Page.orphaned
  end

  def show
    if params[:landing] == 'landing'
      @page = Page.where(landing_page: true).first
    else
      @page = Page.find(params[:id])
    end
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
    if current_admin.super_admin && !@page.landing_page
      @page.destroy
    end
    if @page.category
      redirect_to admin_category_path(@page.category)
    else
      redirect_to admin_pages_path
    end
  end

  private

  def page_params
    ps = params.require(:page)
               .permit(:order, :name, :intro_text, :category_id)
    ps[:admin_id] = current_admin.id
    ps
  end
end
