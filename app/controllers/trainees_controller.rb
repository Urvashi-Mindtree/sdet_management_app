class TraineesController < ApplicationController
  before_action :set_trainee, only: [:show, :edit, :update, :destroy]

  # GET /trainees
  # GET /trainees.json
  def index
    @trainees = Trainee.all
	
  end

  # GET /trainees/1
  # GET /trainees/1.json
  def show
  
  end

  # GET /trainees/new
  def new
    @trainee = Trainee.new
  end

  # GET /trainees/1/edit
  def edit
  end

  # POST /trainees
  # POST /trainees.json
  def create
  count =0
      @trainee = Trainee.new(trainee_params)
	
	@courses = Course.all
	@trainee_record= Trainee.all
	p "**************************Course Email **************************"
	@course_start_date= Course.where(:id => @trainee.course_id).pluck(:start_date)
	p @trainee.trainee_email
	

	
	p "****************************************************************"
	@trainee_record.each do |trainee_row|
	  if trainee_row.trainee_name==@trainee.trainee_name
	    if trainee_row.course_id == @trainee.course_id
		count +=1
		end
	  end
	end
	@courses.each do |course|
		if course.id==@trainee.course_id
		assign_date=@trainee.assign_date-course.start_date
		 if assign_date<=0
		 count +=1
		 end
		end
	end

	
	if count>=1
	flash[:error] = 'Date should be in accordance with start and end date of the course OR Trainee has already applied for the course'
	redirect_to action: "new" and return
	 #redirect_to @new_course 
  end
	
	

    respond_to do |format|
	  p "**************************************************Inside controller"
      if @trainee.save
	  
        format.html { redirect_to @trainee, notice: 'Trainee was successfully created.' }
        format.json { render :show, status: :created, location: @trainee }
      else
        format.html { render :new }
        format.json { render json: @trainee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainees/1
  # PATCH/PUT /trainees/1.json
  def update
    respond_to do |format|
      if @trainee.update(trainee_params)
        format.html { redirect_to @trainee, notice: 'Trainee was successfully updated.' }
        format.json { render :show, status: :ok, location: @trainee }
      else
        format.html { render :edit }
        format.json { render json: @trainee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainees/1
  # DELETE /trainees/1.json
  def destroy
    @trainee.destroy
    respond_to do |format|
      format.html { redirect_to trainees_url, notice: 'Trainee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trainee
      @trainee = Trainee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trainee_params
     params.require(:trainee).permit(:trainee_name, :course_id, :status, :assign_date, :trainee_email)
    end
	
	def options
	p "*********************inside option *******************************"
     id = @trainee.course_id
	 p id
     @course_date = Course.where(:course_id => id)
	 p course_date
     render :partial => 'options'
end
end
