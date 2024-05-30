class FormSubject < ApplicationRecord
  belongs_to :form
  belongs_to :subject
end
