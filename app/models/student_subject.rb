class StudentSubject < ApplicationRecord
  belongs_to :student
  belongs_to :subject
  belongs_to :term
  belongs_to :term
  belongs_to :form
end
