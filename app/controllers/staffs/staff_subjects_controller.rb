class Staffs::StaffSubjectsController < ApplicationController

    def create
        return unless params.has_key?(:subjects) # return if subject dictionary is empty 
        @staff_subject = StaffSubject.create_staff_subject(params)
        

        respond_to do |format|
            if @staff_subject[0]
                format.html { redirect_to forms_url, notice: "Action was successfully" }
                format.json { render :show, status: :created }
            else
                format.html { redirect_to forms_url, notice: "Action Failed" }
                format.json { render json: @staff_subject[1], status: "Action Failed" }
            end
        end
    end

    def destroy
        begin
            staff_subject = StudentSubject.find(params[:id])
            staff_subject.destroy
            redirect_back_or_to root_path,  notice: "Action completed successifully"
        rescue ActiveRecord::RecordNotFound

        end
    end

end
