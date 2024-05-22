class StudentFinalResult < ApplicationRecord
  belongs_to :assessment_type
  belongs_to :student
end
