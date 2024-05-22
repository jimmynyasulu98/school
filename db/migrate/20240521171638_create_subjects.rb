class CreateSubjects < ActiveRecord::Migration[7.1]
  def change
    create_table :subjects do |t|
      t.string :name
      t.boolean :compulsory, default: false
      t.boolean :crucial, default: false

      t.timestamps
    end
  end
end
