class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
	  t.string :course_name
	  t.date :start_date
	  t.date :end_date
    end
  end
end
