class CreateAcademicYears < ActiveRecord::Migration[7.1]
  def change
    create_table :academic_years do |t|
      t.string :name
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
