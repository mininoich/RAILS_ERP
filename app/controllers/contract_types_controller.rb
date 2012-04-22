class ContractTypesController < ApplicationController
	before_filter :authenticate_user!, :only => [:index, :show]
  before_filter :authenticate_admin!, :only => [:new, :create, :edit, :update, :destroy]
  def index
    @contract_type = ContractType.all
  end
  
  def show
    @contract_type = ContractType.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @contract_type }
    end
  end
  
  def new
    @new = true
    @contract_type = ContractType.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @contract_type }
    end
  end
  
  def edit
		@contract_type = ContractType.find(params[:id])
  end
  
  def create
  	@contract_type = ContractType.new(params[:contract_type]) 
  	respond_to do |format|
    	if @contract_type.save
      	format.html  { redirect_to(@contract_type, :notice => 'Contract Type was successfully created.') }
      	format.json  { render :json => @contract_type, :status => :created, :location => @contract_type }
    	else
      	format.html  { render :action => "new" }
      	format.json  { render :json => @contract_type.errors, :status => :unprocessable_entity }
    	end
  	end
	end
  
  def update
  	@contract_type = ContractType.find(params[:id]) 
  	respond_to do |format|
    	if @contract_type.update_attributes(params[:contracttype])
      	format.html  { redirect_to(@contract_type, :notice => 'Contract Type was successfully updated.') }
      	format.json  { head :no_content }
    	else
      	format.html  { render :action => "edit" }
      	format.json  { render :json => @contract_type.errors, :status => :unprocessable_entity }
    	end
  	end
	end
  
  def destroy
    ContractType.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to contract_types_url }
      format.json { head :ok }
    end
  end 
end
