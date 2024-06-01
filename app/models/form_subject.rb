class FormSubject < ApplicationRecord
  belongs_to :form
  belongs_to :subject

  validates_uniqueness_of :form_id, scope: [:subject_id]

  private
    def self.create_form_subject(form_id , subjects)

      return false ,"no class with id: #{form_id}" unless Form.exists?(form_id) 

      subjects.each do |subject_id|
        return false ,"no subject with id: #{subject_id}" unless Subject.exists?(subject_id) 
        FormSubject.create(form_id: form_id,  subject_id:subject_id) 
      end
      return true , "Action completed successifully"
    end

end
