class Score < ApplicationRecord
  belongs_to :subject_assessment
  belongs_to :student
  belongs_to :assessment_grade,optional: true
end
