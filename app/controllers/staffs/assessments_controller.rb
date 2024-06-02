class Staffs::AssessmentsController < ApplicationController

    before_action :find_current_term, only: %i[ index create show edit update destroy ]

    def index
        @staff_subjects = current_staff.staff_subjects.where( term_id: @term.id)
    end

    def new
    end 

    def create
        @assessment_type = AssessmentType.new(name: params[:name], staff_id: current_staff.id, term_id: @term.id)
        respond_to do |format|
            if  @assessment_type.save
                @assessment_type.subject_assessments.build(staff_subject_id: params[:staff_subject]).save

              format.html { redirect_to assessments_path, notice: "Action Completed successfully ." }
              format.json { render :index, status: :created, location: assessments_path }
            else
              format.html { render :index, status: :unprocessable_entity }
              format.json { render json: @assessment_type.errors, status: :unprocessable_entity }
            end
        end
    end 

    def show 
    end 

    def edit
    end

    def update
    end

    def destroy
    end

    private
        def find_current_term
            begin
                @term = Term.last
            rescue ActiveRecord::RecordNotFound
            redirect_back_or_to root_path
            end
        end
end
