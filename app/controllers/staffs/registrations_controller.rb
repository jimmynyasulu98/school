
class Staffs::RegistrationsController < ApplicationController
  before_action :set_staff, only: %i[ show edit update destroy ]
  def index
    @staffs = Staff.all
  end
  # GET /resource/sign_up
  def new
    @staff = Staff.new
  end

  # POST /resource
  def create
    @staff = Staff.new(staff_params)
    #@pass = DefaultPassword.find_by(user: "staff")
    #@staff.encrypted_password = @pass.password_digest
    @staff.password = "12345678"
    
    respond_to do |format|
      if @staff.save
        format.html { redirect_to staff_url(@staff), notice: "Staff member successfully created." }
        format.json { render :show, status: :created, location: @staff }
      else
      
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end
  def show 
    @forms = Form.all
  end
  # GET /resource/edit
  def edit
  end

  # PUT /resource
  def update
    respond_to do |format|
      if @staff.update(staff_params)
        format.html { redirect_to staff_url(@staff), notice: "staff was successfully updated." }
        format.json { render :show, status: :ok, location: @staff }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  private
    def staff_params
    # strong parameters
    params.require(:staff).permit(:title, :username, :email, :first_name, :surname, :gender, :date_of_birth, :date_of_appointment,:phone_number, :marital_status)
    end

    def set_staff
      begin
        @staff = Staff.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_back_or_to root_path
      end
    end

end
