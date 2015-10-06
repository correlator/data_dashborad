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

  def destroy
    if current_admin.super_admin
      Page.find_by(id: params[:id]).destroy
    end
    redirect_to admin_pages_path
  end

  private

  def page_params
    ps = params.require(:page)
               .permit(:order, :name, :intro_text, :category_id)
    ps[:admin_id] = current_admin.id
    ps
  end
end
