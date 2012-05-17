class SupervisorsController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :show]
  before_filter :authenticate_admin!, :only => [:new, :create, :edit, :update, :destroy]
  def index
    @supervisors = Supervisor.all
  end
  
  def show
    @supervisor = Supervisor.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @supervisor }
    end
  end
  
  def new
    @new = true
    @supervisor = Supervisor.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @supervisor }
    end
  end
  
  def edit
      @supervisor = Supervisor.find(params[:id])
      @supervisor.name = @supervisor.user.name
      @supervisor.email = @supervisor.user.email
  end

  def create
    @user = User.new(:name => params[:supervisor][:name], :email => params[:supervisor][:email], :password => params[:supervisor][:password], :password_confirmation => params[:supervisor][:password]) 
    if @user.save 
      @supervisor = @user.supervisors.build(params[:supervisor])
      @supervisor.name = @supervisor.user.name
      @supervisor.email = @supervisor.user.email
      respond_to do |format|
        if @supervisor.save
          format.html { redirect_to @supervisor, :notice => 'Supervisor was successfully created.' }
          format.json { render :json => @supervisor, :status=> :created, :location => @supervisor }
        else
          format.html { render :action => "new" }            
          format.json { render :json => @supervisor.errors, :status => :unprocessable_entity }
        end
      end
    else  
      respond_to do |format|
        format.html { render :action => "new" }
        format.json { render :json => @supervisor.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @supervisor = Supervisor.find(params[:id])
    respond_to do |format|
      if  @supervisor.user.update_attributes(:name => params[:supervisor][:name], :email => params[:supervisor][:email]) && @supervisor.update_attributes(params[:supervisor])
        format.html { redirect_to @supervisor, :notice => 'Supervisor was successfully updated.' }
        format.json { render :json => @supervisor, :status => :created, :location => @supervisor }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @supervisor.errors, :status => :unprocessable_entity }
      end
    end
  end
  
   def destroy
    Supervisor.find(params[:id]).user.destroy

    respond_to do |format|
      format.html { redirect_to supervisors_url }
      format.json { head :ok }
    end
  end    
end

