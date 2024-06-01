
class Students::RegistrationsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy ]

  def index
    @students = Student.all
  end

  # GET /resource/sign_up
  def new
    @student = Student.new
  end

 
  def create
    @student = Student.new(student_params)
    #@pass = DefaultPassword.find_by(user: "student")
    #@student.encrypted_password = @pass.password_digest
    @student.password = "12345678"
    

    respond_to do |format|
      if @student.save
        registration = @student.registrations.build(form_id: params[:form], term_id: Term.last.id)
        registration.save

        format.html { redirect_to student_url(@student), notice: "student successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        puts @student.errors.objects.first.full_message 
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end

  end

  def show
  end

  def edit
  end


  def update
   super
  end

  # DELETE /resource
  def destroy

  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  private
    def student_params
    # strong parameters
      params.require(:student).permit(:title, :username, :email, :first_name, :surname, :gender, :date_of_birth, :date_of_enrollment,:phone_number, :village,:t_a, :district)
    end

    def set_student
      @student= Student.find(params[:id])
    end
end
