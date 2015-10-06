class Admin::ManageAdminsController < AdminController
  layout 'admin'
  before_filter :authorize_superadmin

  def index
    @admins = Admin.all
  end

  def create
    new_admin = Admin.create(email: params[:admin][:email],
                             password: SecureRandom.base64)
    new_admin.send_reset_password_instructions
    flash[:notice] = "Password reset instructions have been sent to #{params[:admin][:email]}"

    redirect_to admin_manage_admins_path
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
      Admin.find_by(id: params[:id]).destroy
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
