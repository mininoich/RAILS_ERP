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
	@datedebut = Date.civil(params[:form][:"date_debut(1i)"].to_i,
	params[:form][:"date_debut(2i)"].to_i,
	params[:form][:"date_debut(3i)"].to_i)
								
	@datefin = Date.civil(params[:form][:"date_fin(1i)"].to_i,
	params[:form][:"date_fin(2i)"].to_i,
	params[:form][:"date_fin(3i)"].to_i)
	
	@company = Company.find(params[:contract][:company])
	@student = Student.find(params[:contract][:student])
	@contract_type = ContractType.find(params[:contract][:contract_type])
										
	@contract = Contract.new(	:date_debut => @datedebut,
										:date_fin => @datefin,
										:company => @company,
										:student => @student,
										:contract_type => @contract_type) 
 
  	respond_to do |format|
    	if @contract.save
      	format.html  { redirect_to(@contract, :notice => 'Contract was successfully created.') }
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
