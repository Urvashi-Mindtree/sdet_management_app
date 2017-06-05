class Trainee < ApplicationRecord

  belongs_to :course  
     validates_presence_of :trainee_name, :trainee_email
	 validates :assign_date, presence: true
	 validates :status, presence: true
	 
	 attr_accessor :match_end_date, :match_start_date
	
end
	 
	
	
 
