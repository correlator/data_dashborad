class PagesController < ApplicationController

  def index
  end

  def show
    @page = Page.find(params[:id])
  end

  def destroy
    if current_admin.super_admin
      Page.find_by(id: params[:id]).destroy
    end
    redirect_to admin_categories_path
  end
end
