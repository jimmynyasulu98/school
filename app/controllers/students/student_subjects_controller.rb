class Students::StudentSubjectsController < ApplicationController
    def create
        return unless params.has_key?(:subjects) # return if subject dictionary is empty 
        @student_subject = StudentSubject.create_student_subject(params)
        
        @student = Student.find(params[:student])
        respond_to do |format|
            if @student_subject[0]
                format.html { redirect_back_or_to root_path, notice: "Action was successfully" }
                format.json { render :show, status: :created }
            else
                format.html { redirect_to student_url(@student), notice: "Action Failed" }
                format.json { render json: @staff_subject[1], status: "Action Failed" }
            end
        end
    end

    def destroy
        begin
            student_subject = StudentSubject.find(params[:id])
            student_subject.destroy
            redirect_back_or_to root_path,  notice: "Action completed successifully"
        rescue ActiveRecord::RecordNotFound

        end
        
      
    end

end
