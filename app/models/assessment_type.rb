class AssessmentType < ApplicationRecord
  belongs_to :staff
  belongs_to :term
end
