class Staffs::ScoresController < ApplicationController

    before_action :find_student_score, only: %i[ create update ]

    def create
        score = get_assessment_grade(params[:score])
        # Redirect back if the score submitted is invalid
        return redirect_back_or_to root_path, notice: "Action denied"  unless  score

        respond_to do |format|
            if  assessment_grade
                @subject_assessment = @assessment_type.subject_assessments.build(staff_subject_id: params[:staff_subject])
                @subject_assessment.save
               
                
                format.html { redirect_to assessments_path, notice: "Action Completed successfully ." }
                format.json { render :index, status: :created, location: assessments_path }
            else
                format.html { render :index, status: :unprocessable_entity }
                format.json { render json: @assessment_type.errors, status: :unprocessable_entity }
            end
        end

    end


    def update
    end


    private

    def get_assessment_grade(score)
        for grade in AssessmentGrade.all
          if Array(grade.start_mark.to_i..grade.end_mark.to_i).include?(score.to_i)
             return  grade.id
          end
        end
        return false
    end

  
    def find_student_score
        @student_score = Score.find(params[:student_score])
    end


end
