class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :load_categories

  private

  def load_categories
    @categories = Category.all.order(:order)
  end

  def authorize_superadmin
    if current_admin.nil? || !current_admin.super_admin
      flash[:info] = 'Access is restricted to super admins.'
      redirect_to root_path
    end
  end

  def authorize_admin
    if current_admin.nil?
      flash[:info] = 'Access is restricted to admins.'
      redirect_to root_path
    end
  end

  def after_sign_in_path_for(resource)
    admin_categories_path
  end
end
