class Course < ApplicationRecord
has_many :trainee
     validates_presence_of :course_name
	 validates :start_date, presence: true
	 validates :end_date, presence: true
	 validates :course_name, uniqueness: { case_sensitive: false }
	 
	 validate :date_cannot_be_in_the_past
	 
	 validate :end_date_cannot_be_equal_to_start_date

  def date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end 
	
	 if end_date.present? && end_date < Date.today
      errors.add(:end_date, "can't be in the past")
    end 
  end
  
   def end_date_cannot_be_equal_to_start_date
   	 if end_date.present? && end_date == start_date 
      errors.add(:end_date, "can't be same as start date")
    end 
  end
  
  end
