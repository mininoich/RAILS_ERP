class TeachersController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  
  def index
    @teachers = Teacher.all
  end
  
  def show
    @teacher = Teacher.find(params[:id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @teacher }
    end
  end
  
  def new
    @teacher = Teacher.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @teacher }
    end
  end
  
  def edit
      @teacher = Teacher.find(params[:id])
      @teacher.name = @teacher.user.name
      @teacher.email = @teacher.user.email
  end

  def create
    @user = User.new(:name => params[:teacher][:name], :email => params[:teacher][:email], :password => params[:teacher][:password], :password_confirmation => params[:teacher][:password]) 
    if @user.save 
      @teacher = @user.teachers.build
      @subjects = Subject.find(params[:subjects])
      #@teacher.subjects = @subjects
      respond_to do |format|
        if @teacher.save
          format.html { redirect_to @teacher, :notice => 'Teacher was successfully created.' }
          format.json { render :json => @teacher, :status=> :created, :location => @teacher }
        else
          format.html { render :action => "new" }            
          format.json { render :json => @teacher.errors, :status => :unprocessable_entity }
        end
      end
    else  
      format.html { render :action => "new" }
      format.json { render :json => @teacher.errors, :status => :unprocessable_entity }
    end
  end
  
  def update
    @teacher = Teacher.find(params[:id])
    
    respond_to do |format|
      if  @teacher.user.update_attributes(:name => params[:teacher][:name]) && @teacher.update_attributes(params[:teacher])
        format.html { redirect_to @teacher, :notice => 'Teacher was successfully updated.' }
        format.json { render :json => @teacher, :status => :created, :location => @teacher }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @teacher.errors, :status => :unprocessable_entity }
      end
    end
  end
  
   def destroy
    @teacher = Teacher.find(params[:id])
    @user = @teacher.user
    @teacher.destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to teachers_url }
      format.json { head :ok }
    end
  end    
end

