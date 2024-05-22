class CreateScores < ActiveRecord::Migration[7.1]
  def change
    create_table :scores do |t|
      t.references :subject_assessment, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.decimal :score, null: true
      t.references :assessment_grade, null: true, foreign_key: true

      t.timestamps
    end
  end
end
