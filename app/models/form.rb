class Form < ApplicationRecord
    has_many :form_subjects
    has_many :subjects, through: :form_subjects
end
