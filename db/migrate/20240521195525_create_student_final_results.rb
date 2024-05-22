class CreateStudentFinalResults < ActiveRecord::Migration[7.1]
  def change
    create_table :student_final_results do |t|
      t.references :assessment_type, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.decimal :total_marks, default: 0.00
      t.decimal :best_subjects_total, default: 0.00
      t.boolean :final_remark, default: false
      t.string :final_letter_grade

      t.timestamps
    end
  end
end
