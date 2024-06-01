class CreateFormSubjects < ActiveRecord::Migration[7.1]
  def change
    create_table :form_subjects do |t|
      t.references :form, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      
      t.timestamps
    end


    add_index :form_subjects, [:form_id, :subject_id], unique: true
  end
end
