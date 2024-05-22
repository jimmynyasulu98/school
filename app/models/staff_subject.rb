class StaffSubject < ApplicationRecord
  belongs_to :staff
  belongs_to :subject
  belongs_to :term
  belongs_to :form
end
