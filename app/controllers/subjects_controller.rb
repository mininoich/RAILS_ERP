class SubjectsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  
  def index
    @subjects = Subject.all
  end
  
  def show
    @subject = Subject.find(params[:id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @subject }
    end
  end
  
  def new
    @subject = Subject.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @subject }
    end
  end
  
  def edit
      @subject = Subject.find(params[:id])
  end

  def create
    @subject = Subject.new(params[:subject]) 
    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, :notice => 'Subject was successfully created.' }
        format.json { render :json => @subject, :status=> :created, :location => @subject }
      else          
        format.html { render :action => "new" }            
        format.json { render :json => @subject.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @subject = Subject.find(params[:id])
    
    respond_to do |format|
      if  @subject.update_attributes(params[:subject])
        format.html { redirect_to @subject, :notice => 'Subject was successfully updated.' }
        format.json { render :json => @subject, :status => :created, :location => @subject }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @subject.errors, :status => :unprocessable_entity }
      end
    end
  end
  
   def destroy
    Subject.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to subjects_url }
      format.json { head :ok }
    end
  end    
end

