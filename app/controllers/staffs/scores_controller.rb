class Staffs::ScoresController < ApplicationController

    before_action :find_student_score, only: %i[ create update ]

    def create
        score = get_assessment_grade(params[:score])
        # Redirect back if the score submitted is invalid
        return redirect_back_or_to root_path, notice: "Action denied"  unless  score
        

        respond_to do |format|
            # update the score if it is valid
            @student_score.score = params[:score]
            @student_score.assessment_grade_id = score

            if  @student_score.save  
                # Add scores to student final result if the assessment is mandatory for every 
                # staff member (e.g end of term or mid term)
                if @student_score.subject_assessment.assessment_type.mandatory
                    student_final_score(@student_score)
                end

                format.html { redirect_to assessment_path(@student_score.subject_assessment_id), notice: "Action Completed successfully ." }
                format.json { redirect_to assessment_path(@student_score.subject_assessment_id), status: :created }
            else
                format.html { redirect_to assessment_path(@student_score.subject_assessment_id), status: :unprocessable_entity }
                format.json { render json: @student_score.errors, status: :unprocessable_entity }
            end
        end

    end


    def update
        score = get_assessment_grade(params[:score])
        # Redirect back if the score submitted is invalid
        return redirect_back_or_to root_path, notice: "Action denied"  unless  score
        
        respond_to do |format|
            # get old score before editing to current score 
            old_score = @student_score.score 

            # update the score if it is valid
            @student_score.score = params[:score]
            @student_score.assessment_grade_id = score

            if  @student_score.save  
                # Add scores to student final result if the assessment is mandatory for every 
                # staff member (e.g end of term or mid term)
                if @student_score.subject_assessment.assessment_type.mandatory
                    edit_student_final_scores(@student_score,old_score )
                end

                format.html { redirect_to assessment_path(@student_score.subject_assessment_id), notice: "Action Completed successfully ." }
                format.json { redirect_to assessment_path(@student_score.subject_assessment_id), status: :created }
            else
                format.html { redirect_to assessment_path(@student_score.subject_assessment_id), status: :unprocessable_entity }
                format.json { render json: @student_score.errors, status: :unprocessable_entity }
            end
        end
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
        @student_score = Score.find(params[:id])
    end

    # Calculate final results based on the scores entered for a mandatory exam
    def student_final_score(student_score)

        assessment = student_score.subject_assessment.assessment_type_id
        student = student_score.student_id
        @student_final_result = StudentFinalResult.find_by(assessment_type_id:assessment , student_id:student )

        if @student_final_result
            # Edit the score if the record already exist, 
            @student_final_result.total_marks += student_score.score 
            @student_final_result.save
        else
            StudentFinalResult.create(assessment_type_id:assessment, student_id:student,total_marks: student_score.score)
        end
    end

    def edit_student_final_scores(student_score, old_score = 0.0)
        assessment = student_score.subject_assessment.assessment_type_id
        student = student_score.student_id
        @student_final_result = StudentFinalResult.find_by(assessment_type_id:assessment , student_id:student )

        if @student_final_result
            # Edit the score if the record already exist, 
            # Update the difference between current and old score to final result
            @student_final_result.total_marks += student_score.score - old_score
            @student_final_result.save
        else
            return 
        end
    end



end
