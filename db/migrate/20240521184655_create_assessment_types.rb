class CreateAssessmentTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :assessment_types do |t|
      t.string :name
      t.references :staff, null: false, foreign_key: true
      t.references :term, null: false, foreign_key: true
      t.boolean :end_of_term,default: false
      t.boolean :mandatory, default: false
      t.boolean :released, default: false
      t.timestamps
    end
  end
end