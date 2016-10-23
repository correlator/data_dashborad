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
    respond_to do |format|
      format.js
      format.html { redirect_to admin_categories_path }
    end
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
    redirect_to admin_categories_path
  end

  def reorder
    params[:content_ids].each_with_index do |content_id, index|
      Content.where(id: content_id).update_all(order: index)
    end
    respond_to do |format|
      format.json { render json: true }
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
