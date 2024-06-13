
class Staffs::MandatoryAssessmentsController < ApplicationController
   
    before_action :find_current_term, only: %i[ index create show edit update destroy ]
    include Assessment

    def index
        @mandatory_assessments = AssessmentType.where(term: @term , mandatory: true)
    end

    def new
    end 

    def create 
        @assessment_type = AssessmentType.new(name: params[:name], staff_id: current_staff.id, term_id: @term.id, mandatory: true)
        
        respond_to do |format|
            if  @assessment_type.save
                #staff subjects to be used to create new  subject assessments
                staff_subjects = StaffSubject.where(term_id: @term.id, form_id: params[:forms])
                new_mandatory_assessment(@assessment_type , staff_subjects) # class from assessment module (concern)

                format.html { redirect_to mandatory_assessments_path, notice: "Action Completed successfully ." }
                format.json { render :index, status: :created, location: mandatory_assessments_path }
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
