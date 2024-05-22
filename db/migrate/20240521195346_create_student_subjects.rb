class CreateStudentSubjects < ActiveRecord::Migration[7.1]
  def change
    create_table :student_subjects do |t|
      t.references :student, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.references :term, null: false, foreign_key: true
      t.references :form, null: false, foreign_key: true

      t.timestamps
    end
  end
end
