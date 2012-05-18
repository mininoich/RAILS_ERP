class LessonsController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @lessons = Lesson.all
  end
  
  def show
    @lesson = Lesson.find(params[:id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @lesson }
    end
  end
  
  def new
    @lesson = Lesson.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @lesson }
    end
  end
  
  def edit
      @lesson = Lesson.find(params[:id])
      @lesson.date_hour_start = @lesson.date_hour_start
      @lesson.date_hour_end = @lesson.date_hour_end
  end
  
  def create
	@lesson = Lesson.new(params[:lesson])

	respond_to do |format|
		if @lesson.save
			format.html{ redirect_to @lesson, notice: 'Lesson was successfully created'}
		else
			format.html{ render action: "new" }
		end
	end
  end
  
  def update
    @lesson = Lesson.find(params[:id])
    
    respond_to do |format|
      if  @lesson.update_attributes(params[:lesson])
        format.html { redirect_to @lesson, notice: 'Lesson was successfully updated' }
      else
        format.html { render action: "edit" }
      end
    end
  end
  
  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy

    respond_to do |format|
      format.html { redirect_to lessons_url }
      format.json { head :ok }
    end
  end 
  
end
