class AssessmentType < ApplicationRecord
  belongs_to :staff
  belongs_to :term
  has_many :subject_assessments, dependent: :destroy
  
end
