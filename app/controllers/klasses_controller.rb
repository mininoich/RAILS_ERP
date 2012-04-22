class KlassesController < ApplicationController
  before_filter :authenticate_admin!
  
  def index
    @klasses = Klass.all
  end
  
  def show
    @klass = Klass.find(params[:id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @klass }
    end
  end
  
  def new
    @klass = Klass.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @klass }
    end
  end
  
  def edit
      @klass = Klass.find(params[:id])
  end

  def create
    @klass = Klass.new(params[:klass]) 
    respond_to do |format|
      if @klass.save
        format.html { redirect_to @klass, :notice => 'Class was successfully created.' }
        format.json { render :json => @klass, :status=> :created, :location => @klass }
      else          
        format.html { render :action => "new" }            
        format.json { render :json => @klass.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @klass = Klass.find(params[:id])
    
    respond_to do |format|
      if  @klass.update_attributes(params[:klass])
        format.html { redirect_to @klass, :notice => 'Klass was successfully updated.' }
        format.json { render :json => @klass, :status => :created, :location => @klass }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @klass.errors, :status => :unprocessable_entity }
      end
    end
  end
  
   def destroy
    Klass.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to klasses_url }
      format.json { head :ok }
    end
  end    
end

