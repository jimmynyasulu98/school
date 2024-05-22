class CreateSubjectAssessments < ActiveRecord::Migration[7.1]
  def change
    create_table :subject_assessments do |t|
      t.references :staff_subject, null: false, foreign_key: true
      t.references :assessment_type, null: false, foreign_key: true
      t.boolean :submitted, default: false
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end
