class AbsencesController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @absences = Absence.all
  end
  
  def show
    @absence = Absence.find(params[:id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @absence }
    end
  end
  
  def new
    @absence = Absence.new    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @absence }
    end
  end
  
  def edit
      @absence = Absence.find(params[:id])
      @absence.justificative = @absence.justificative
  end
  
  def create
	@absence = Absence.new(params[:absence])

	respond_to do |format|
		if @absence.save
			format.html{ redirect_to @absence, notice: 'Absence was successfully created'}
		else
			format.html{ render action: "new" }
		end
	end
  end
  
  def update
    @absence = Absence.find(params[:id])
    
    respond_to do |format|
      if  @absence.update_attributes(params[:absence])
        format.html { redirect_to @absence, notice: 'Absence was successfully updated' }
      else
        format.html { render action: "edit" }
      end
    end
  end
  
  def destroy
    @absence = Absence.find(params[:id])
    @absence.destroy

    respond_to do |format|
      format.html { redirect_to absences_url }
      format.json { head :ok }
    end
  end 

end
