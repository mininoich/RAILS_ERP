class TeachersController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :show]
  before_filter :authenticate_admin!, :only => [:new, :create, :edit, :update, :destroy]
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
    @new = true
    @teacher = Teacher.new
    @subjects = Subject.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @teacher }
    end
  end
  
  def edit
      @subjects = Subject.all
      @teacher = Teacher.find(params[:id])
      @teacher.name = @teacher.user.name
      @teacher.email = @teacher.user.email
      @teacher.password = @teacher.user.password
  end

  def create
    @user = User.new(:name => params[:teacher][:name], :email => params[:teacher][:email], :password => params[:teacher][:password], :password_confirmation => params[:teacher][:password]) 
    
    if @user.save 
      @teacher = @user.teachers.build
      @teacher.name = @teacher.user.name
      @teacher.email = @teacher.user.email
      respond_to do |format|
        if @teacher.save
          if !params[:subject_ids].blank?
            params[:subject_ids].each do |id|
              @teacher.abilities.create(:subject_id => id)
            end
          end
          format.html { redirect_to @teacher, :notice => 'Teacher was successfully created.' }
          format.json { render :json => @teacher, :status=> :created, :location => @teacher }
        else
          format.html { render :action => "new" }            
          format.json { render :json => @teacher.errors, :status => :unprocessable_entity }
        end
      end
    else  
      respond_to do |format|
        format.html { render :action => "new" }
        format.json { render :json => @teacher.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @teacher = Teacher.find(params[:id])
    respond_to do |format|
      if  @teacher.user.update_attributes(:name => params[:teacher][:name], :email => params[:teacher][:email]) && @teacher.update_attributes(params[:teacher])
        @teacher.abilities.destroy_all
        params[:subject_ids].each do |id|
          @teacher.abilities.create(:subject_id => id)
        end
        format.html { redirect_to @teacher, :notice => 'Teacher was successfully updated.' }
        format.json { render :json => @teacher, :status => :created, :location => @teacher }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @teacher.errors, :status => :unprocessable_entity }
      end
    end
  end
  
   def destroy
    Teacher.find(params[:id]).user.destroy

    respond_to do |format|
      format.html { redirect_to teachers_url }
      format.json { head :ok }
    end
  end    
end

