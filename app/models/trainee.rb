class Trainee < ApplicationRecord
  belongs_to :course  
  attr_accessor :end_date, :start_date
    validates_presence_of :trainee_name
	validates :status, presence: true
	validates :end_date, presence: true
	validates :start_date, presence: true	
    validates :course_id, presence: true	
	validates :trainee_email, presence: true,:uniqueness => { :case_sensitive => false }	 
	validate :assign_date_should_fall_in_range
	validate :already_assigned_course
	 
	def assign_date_should_fall_in_range 
	  if assign_date == nil
        errors.add(:assign_date, "assign_date should be not be blank")	  
	  elsif assign_date<course.start_date || assign_date>course.end_date
		errors.add(:assign_date, "should be in accordance with course date")
	  else
	  end
    end	
	
	
	def already_assigned_course
	@trainee_record= Trainee.all
	  @trainee_record.each do |trainee_row|
	  if trainee_row.trainee_name==trainee_name
	    if trainee_row.course_id == course_id
		errors.add(:course_id, "course is already assigned")
		end
	  end
	end
	end
end
	 
	
	
 
