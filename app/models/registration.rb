class Registration < ApplicationRecord
  belongs_to :student
  belongs_to :term
  belongs_to :form
end
