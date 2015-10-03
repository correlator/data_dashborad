class RegistrationsController < Devise::RegistrationsController
  before_filter :authorize_superadmin
  def new
    if current_admin.nil? || !current_admin.super_admin
      flash[:info] = 'Registrations are not open.'
      redirect_to root_path
    else
      super
    end
  end

  def create
    unless current_admin && current_admin.super_admin
      flash[:info] = 'Registrations are not open.'
      redirect_to root_path
    end
    super
  end
end
