class Admin::ManageAdminsController < AdminController
  layout 'admin'
  before_filter :authorize_superadmin

  def index
    @admins = Admin.all
  end

  def update
    @admin = Admin.find(params[:id])
    respond_to do |format|
      if @admin.update(admin_params)
        format.json { render json: @admin }
      else
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if current_admin.id.to_s != params[:id]
      Admin.find_by(id: params[:id])
    end
    redirect_to admin_manage_admins_path
  end

  private

  def admin_params
    ps = params.require(:admin).permit(:super_admin)
    ps[:password_confirmation] = ps['password']
    ps
  end
end
