class RoomsController < ApplicationController
	before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  
  def index
    @rooms = Room.all
  end
  
  def show
    @room = Room.find(params[:id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @room }
    end
  end
  
  def new
    @room = Room.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @room }
    end
  end
  
  def edit
      @room = Room.find(params[:id])
      @room.name = @room.name
      @room.nb_places = @room.nb_places
      @room.nb_computers = @room.nb_computers
  end

  def create
	@room = Room.new(params[:room])

	respond_to do |format|
		if @room.save
			format.html{ redirect_to @room, notice: 'Room was successfully created'}
		else
			format.html{ render action: "new" }
		end
	end
  end
  
  def update
    @room = Room.find(params[:id])
    
    respond_to do |format|
      if  @room.update_attributes(params[:room])
        format.html { redirect_to @room, notice: 'Room was successfully updated' }
      else
        format.html { render action: "edit" }
      end
    end
  end
  
   def destroy
    @room = Room.find(params[:id])
    @room.destroy

    respond_to do |format|
      format.html { redirect_to rooms_url }
      format.json { head :ok }
    end
  end    
end
