class TraineeModuleController < ApplicationController
  def assign
  @user = current_user.email
  @trainee= Trainee.where("trainee_email=?",@user) 
  end

  def completed
    @user = current_user.email
    @trainee_completed= Trainee.find_by_sql("select * from Trainees where trainee_email='"+@user+"' and status='Completed'")
    @trainee_in_progress= Trainee.find_by_sql("select * from Trainees where trainee_email='"+@user+"' and status='In Progress'")
  end
end
