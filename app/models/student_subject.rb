class StudentSubject < ApplicationRecord
  belongs_to :student
  belongs_to :subject
  belongs_to :term
  belongs_to :term
  belongs_to :form

  validates_uniqueness_of :student_id, scope: [:subject_id, :form_id, :term_id ]

  private
    def self.create_student_subject(params)

       return false ,"no staff or class id match" unless Staff.exists?(params[:student]) or Form.exists?(params[:form]) 
      term = Term.last
      params[:subjects].each do |subject_id|
        return false ,"no subject with id: #{subject_id}" unless Subject.exists?(subject_id) 
        StudentSubject.create(student_id:params[:student], form_id:params[:form],subject_id:subject_id, term_id: term.id) 
      end
      return true, "Action was completed successifully"
    end

end
