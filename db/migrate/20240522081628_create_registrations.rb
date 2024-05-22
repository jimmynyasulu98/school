class CreateRegistrations < ActiveRecord::Migration[7.1]
  def change
    create_table :registrations do |t|
      t.references :student, null: false, foreign_key: true
      t.references :term, null: false, foreign_key: true
      t.references :form, null: false, foreign_key: true
      t.boolean :registered, default: false
      t.timestamps
    end
  end
end
