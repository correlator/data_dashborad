class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def authorize_superadmin
    if current_admin.nil? || !current_admin.super_admin
      flash[:info] = 'Registrations are not open.'
      redirect_to root_path
    end
  end
end
