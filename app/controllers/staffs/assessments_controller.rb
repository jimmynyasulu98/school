class Staffs::AssessmentsController < ApplicationController

    before_action :find_current_term, only: %i[ index create show edit update destroy ]

    before_action :find_staff_subject, only: %i[ create ]

    def index
        @staff_subjects = current_staff.staff_subjects.where( term_id: @term.id)
    end

    def new
    end 

    def create
        @assessment_type = AssessmentType.new(name: params[:name], staff_id: current_staff.id, term_id: @term.id)
        @assessment_type.save
        respond_to do |format|
            if  @assessment_type.save
                @subject_assessment = @assessment_type.subject_assessments.build(staff_subject_id: params[:staff_subject])
                @subject_assessment.save
               
                @students = StudentSubject.where(subject_id:@staff_subject.subject_id, form_id:@staff_subject.form_id,term_id:@staff_subject.term_id)

                @students.each do |student|
                    @score = Score.new(subject_assessment_id: @subject_assessment.id,student_id: student.student_id)
                    @score.save
                end
                format.html { redirect_to assessments_path, notice: "Action Completed successfully ." }
                format.json { render :index, status: :created, location: assessments_path }
            else
                format.html { render :index, status: :unprocessable_entity }
                format.json { render json: @assessment_type.errors, status: :unprocessable_entity }
            end
        end
    end 

    def show 
        @subject_assessment = SubjectAssessment.find(params[:id])
    end 

    def edit
    end

    def update
    end

    def destroy
        @assessment = AssessmentType.find(params[:id])
        @assessment.destroy
        redirect_to assessments_path, notice: "Action Completed successfully ." 
    end

    private
        def find_current_term
            begin
                @term = Term.last
            rescue ActiveRecord::RecordNotFound
            redirect_back_or_to root_path
            end
        end

        def find_staff_subject
            begin
                @staff_subject = StaffSubject.find(params[:staff_subject])
            rescue ActiveRecord::RecordNotFound
            redirect_back_or_to root_path
            end
        end

       
end
