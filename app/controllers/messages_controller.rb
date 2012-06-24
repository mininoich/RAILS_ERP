class MessagesController < ApplicationController
  before_filter :authenticate_user!
  
  def reply
  end
  
  def index
    @mails = current_user.received_messages
  end
  
  def new
    @mail = Message.new
  end
  
  def create
    to = User.find_by_name(params[:message][:recipient])
    
    @mail = Message.new
    @mail.subject = params[:message][:subject]
    @mail.body = params[:message][:body]
    @mail.sender = current_user
    @mail.recipient = to
    
    
    
    respond_to do |format|
      if @mail.save
        format.html { redirect_to @mail, :notice => 'Message was successfully sent' }
        format.json { render :json => @mail, :status=> :created, :location => @mail }
      else
        format.html { render :action => "new" }            
        format.json { render :json => @mail.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  
  def show
    @mail = Message.read_message(params[:id], current_user)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @teacher }
    end
  end
  
  def destroy
    message = current_user.received_messages.find(params[:id])
    message.mark_deleted(current_user)
    
    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :ok }
    end
  end
end
