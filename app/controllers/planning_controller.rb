class PlanningController < ApplicationController
  
  before_filter :authenticate_student!, :only => [:index]
  
  def index
    # @lessons = current_user.students.first.klass.lessons.where(:date_hour_start => ('2012-05-18')..('2012-05-19'))
    @lessons = current_user.students.first.klass.lessons
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @lessons }
    end
  end
end
