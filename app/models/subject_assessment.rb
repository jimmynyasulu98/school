class SubjectAssessment < ApplicationRecord
  belongs_to :staff_subject
  belongs_to :assessment_type
 
  has_many :scores, dependent: :destroy

end
