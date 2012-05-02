class ContractsController < ApplicationController
	before_filter :authenticate_user!, :only => [:index, :show]
  before_filter :authenticate_admin!, :only => [:new, :create, :edit, :update, :destroy]
  def index
    @contracts = Contract.all
  end
  
  def show
    @contract = Contract.find(params[:id], :include => [:student, :company, :contract_type])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @contract_type }
    end
  end
  
  def new
    @new = true
    @contract = Contract.new
    @students = Student.all    
    @companies = Company.all
    @contract_types = ContractType.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @contract }
    end
  end
  
  def edit
		@contract = Contract.find(params[:id], :include => [:student, :company, :contract_type])
  end
  

 
  def create
  	@contract = Contract.new( :student_id => params[:contract][:student], 
  														:company_id => params[:contract][:company], 
  														:contract_type_id => params[:contract][:contrac_type],
  														:date_debut => params[:contract][:date_debut],
  														:date_fin => params[:contract][:date_fin])
  	respond_to do |format|
    	if @contract.save
      	format.html  { redirect_to(@contract, :notice => 'Contract Type was successfully created.') }
      	format.json  { render :json => @contract, :status => :created, :location => @contract }
    	else
      	format.html  { render :action => "new" }
      	format.json  { render :json => @contract.errors, :status => :unprocessable_entity }
    	end
  	end
	end
  
  def update
  	@contract = Contract.find(params[:id]) 
  	respond_to do |format|
    	if @contract.update_attributes(params[:contract])
      	format.html  { redirect_to(@contract, :notice => 'Contract Type was successfully updated.') }
      	format.json  { head :no_content }
    	else
      	format.html  { render :action => "edit" }
      	format.json  { render :json => @contract.errors, :status => :unprocessable_entity }
    	end
  	end
	end
  
  def destroy
    Contract.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to contract_url }
      format.json { head :ok }
    end
  end 
end
