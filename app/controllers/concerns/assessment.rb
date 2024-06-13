
module Assessment
    extend ActiveSupport::Concern
  
    included do
      # Add shared instance methods here
      # Example:
      # has_secure_password
    end
 

    def new_mandatory_assessment(assessment_type , staff_subjects)
     
      staff_subjects.each do |staff_subject|
        # Create a mandatory assessment for all subjects 
        @subject_assessment = assessment_type.subject_assessments.build(staff_subject_id: staff_subject.id)
        @subject_assessment.save # !!!!!!! before save check if subjects has students
        
        @students = StudentSubject.where(subject_id:staff_subject.subject_id, form_id:staff_subject.form_id,term_id:staff_subject.term_id)

        @students.each do |student|
            @score = Score.new(subject_assessment_id: @subject_assessment.id,student_id: student.student_id)
            @score.save
        end
      end  
      
    end
    
end
