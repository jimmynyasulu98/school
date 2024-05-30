class CreateTerms < ActiveRecord::Migration[7.1]
  def change
    create_table :terms do |t|
      t.string :name
      t.belongs_to :academic_year, null: false, foreign_key: true
      t.boolean :registration_open, default: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
