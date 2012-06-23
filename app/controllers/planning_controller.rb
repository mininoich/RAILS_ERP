class PlanningController < ApplicationController
  
  before_filter :authenticate_user!, :only => [:index]
  
  def index
    # @lessons = current_user.students.first.klass.lessons.where(:date_hour_start => ('2012-05-18')..('2012-05-19'))
    #@lessons = current_user.students.first.klass.lessons
    
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
    @shown_month = Date.civil(@year, @month)
    
    if student_signed_in? 
      @event_strips =  current_user.students.first.klass.events.event_strips_for_month(@shown_month)
    elsif teacher_signed_in? 
      @event_strips =  current_user.teachers.first.events.event_strips_for_month(@shown_month)
    else #Pedago (Admin) 
      @event_strips =  Event.event_strips_for_month(@shown_month)
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @lessons }
    end
  end
end
