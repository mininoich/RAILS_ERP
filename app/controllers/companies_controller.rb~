class CompaniesController < ApplicationController
	before_filter :authenticate_user!, :only => [:index, :show]
  before_filter :authenticate_admin!, :only => [:new, :create, :edit, :update, :destroy]
  def index
    @companies = Company.all
  end
  
  def show
    @company = Company.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @company }
    end
  end
  
  def new
    @new = true
    @company = Company.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @company }
    end
  end
  
  def edit
      @company = Company.find(params[:id])
  end
  
  def create
  	@company = Company.new(params[:company]) 
  	respond_to do |format|
    	if @company.save
      	format.html  { redirect_to(@company, :notice => 'Company was successfully created.') }
      	format.json  { render :json => @company, :status => :created, :location => @company }
    	else
      	format.html  { render :action => "new" }
      	format.json  { render :json => @company.errors, :status => :unprocessable_entity }
    	end
  	end
	end
  
  def update
  	@company = Company.find(params[:id]) 
  	respond_to do |format|
    	if @company.update_attributes(params[:company])
      	format.html  { redirect_to(@company, :notice => 'Company was successfully updated.') }
      	format.json  { head :no_content }
    	else
      	format.html  { render :action => "edit" }
      	format.json  { render :json => @company.errors, :status => :unprocessable_entity }
    	end
  	end
	end
  
  def destroy
    Company.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :ok }
    end
  end 
end
