class CreateStaffSubjects < ActiveRecord::Migration[7.1]
  def change
    create_table :staff_subjects do |t|
      t.references :staff, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.references :term, null: false, foreign_key: true
      t.references :form, null: false, foreign_key: true
      t.boolean :core_teacher, :default false
    

      t.timestamps
    end
  end
end
