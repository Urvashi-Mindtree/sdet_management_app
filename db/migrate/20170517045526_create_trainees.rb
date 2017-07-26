class CreateTrainees < ActiveRecord::Migration[5.1]
  def change
    create_table :trainees do |t|
	  t.references :course, index: true, foreign_key: true
	  t.string :trainee_name , null: false
      t.string :status, null: false
	  t.string :trainee_email,              null: false
	  t.date :assign_date, null: false
    end
  end
end
