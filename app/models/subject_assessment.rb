class SubjectAssessment < ApplicationRecord
  belongs_to :staff_subject
  belongs_to :assessment_type
 
end
