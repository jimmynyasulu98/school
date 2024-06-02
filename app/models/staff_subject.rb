class StaffSubject < ApplicationRecord
  belongs_to :staff
  belongs_to :subject
  belongs_to :term
  belongs_to :form

  validates_uniqueness_of :staff_id, scope: [:subject_id,:form_id ]
  has_many :subject_assessments
  

  private
    def self.create_staff_subject(params)

       return false ,"no staff or class id match" unless Staff.exists?(params[:staff]) or Form.exists?(params[:form]) 
      term = Term.last
      params[:subjects].each do |subject_id|
        return false ,"no subject with id: #{subject_id}" unless Subject.exists?(subject_id) 
        StaffSubject.create(staff_id:params[:staff], form_id:params[:form],subject_id:subject_id, term_id: term.id) 
      end
      return true, "Action was completed successifully"
    end
end
