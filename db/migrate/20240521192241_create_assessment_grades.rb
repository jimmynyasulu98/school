class CreateAssessmentGrades < ActiveRecord::Migration[7.1]
  def change
    create_table :assessment_grades do |t|
      t.decimal :start_mark, null: false
      t.decimal :end_mark, null: false
      t.string :letter_grade, null: false
      t.boolean :remark, default: false

      t.timestamps
    end
  end
end
