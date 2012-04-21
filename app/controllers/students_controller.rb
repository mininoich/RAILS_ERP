class StudentsController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :show]
  before_filter :authenticate_admin!, :only => [:new, :create, :edit, :update, :destroy]
  def index
    @students = Student.all
  end
  
  def show
    @student = Student.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @student }
    end
  end
  
  def new
    @new = true
    @student = Student.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @student }
    end
  end
  
  def edit
      @student = Student.find(params[:id])
      @student.name = @student.user.name
      @student.email = @student.user.email
  end

  def create
    @user = User.new(:name => params[:student][:name], :email => params[:student][:email], :password => params[:student][:password], :password_confirmation => params[:student][:password]) 
    if @user.save 
      @student = @user.students.build
      @student.name = @student.user.name
      @student.email = @student.user.email
      respond_to do |format|
        if @student.save
          format.html { redirect_to @student, :notice => 'Student was successfully created.' }
          format.json { render :json => @student, :status=> :created, :location => @student }
        else
          format.html { render :action => "new" }            
          format.json { render :json => @student.errors, :status => :unprocessable_entity }
        end
      end
    else  
      respond_to do |format|
        format.html { render :action => "new" }
        format.json { render :json => @student.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @student = Student.find(params[:id])
    respond_to do |format|
      if  @student.user.update_attributes(:name => params[:student][:name], :email => params[:student][:email]) && @student.update_attributes(params[:student])
        format.html { redirect_to @student, :notice => 'Student was successfully updated.' }
        format.json { render :json => @student, :status => :created, :location => @student }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @student.errors, :status => :unprocessable_entity }
      end
    end
  end
  
   def destroy
    @student = Student.find(params[:id])
    @user = @student.user
    @student.destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :ok }
    end
  end    
end

