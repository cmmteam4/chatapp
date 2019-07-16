class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :edit, :update, :destroy]
   
  
  #GET /channellist
  #def channellist
    #@workspace=Workspace.find(params[:id])
    #@channels = Channel.where(:workspace_id => @workspace.id)    
  #end

  def channelsetting
    @workspace=Workspace.find(params[:id])
    @channels = Channel.where(:workspace_id => @workspace.id)   
  end


  # GET /channels
  def index
    @channels = Channel.all
  end

  # GET /channels/
  def show 
    @channel=Channel.find(params[:id])
    @workspace=Workspace.find(session[:curr_workspace_id])
    @channels=Channel.where(:workspace => session[:curr_workspace_id])
    @message = Message.new
    @messages = Message.all.includes(:user).where(:channel => @channel.id)
    helpers.set_channel @channel   
    #@users = current_user.invites.where(role: 'member')
    #@invite_member = User.all.find(current_user.id).invites.where(role: 'member')
    #user.invites.find_by(channel_id: params[:channel_id]).role == 'member'
    #helpers.get_chat_user 
   
   
  end

  
  #def cshow
    #@channel=Channel.find(params[:cid])
    #@channels=Channel.all 
    #@messages=Message.new   
    #@workspace = Workspace.find(params[:wid])  
   # @channels=Channel.where(:workspace => params[:wid])    
   # render template:"channels/show"
 # end 
  
  # GET /channels/new
  def new
    @channel = Channel.new
    @workspace = Workspace.find(params[:id])
  end

  # GET /channels/1/edit
  def edit    
    @channel = Channel.find(params[:id])
    @workspace = Workspace.find(session[:curr_workspace_id])
  end

  # POST /channels  
  def create      
    @channel = Channel.new(channel_name:params[:channel_name],channel_type:params[:channel_type],workspace_id:params[:workspace_id])
    @channel.save          
    @current=Channel.last
    @uchannel=Invite.new(user_id: current_user.id, channel_id: @current.id, role: "owner")
    @uchannel.save   
    @workspace = Workspace.all
    @workspace = Workspace.find(params[:workspace_id])
    redirect_to workspace_path(@workspace) 
  end

  # PATCH/PUT /channels/1
  def update
    if @channel.update_attributes(channel_params)     
      @workspace = Workspace.find(session[:curr_workspace_id])  
      redirect_to workspace_path(@workspace) 
      #redirect_to workspace_path(@workspace) 
      #redirect_to :controller => "workspaces", :action => "show", :id => @workspace.workspace_id
    else
      render 'edit'
    end
  end

  # DELETE /channels/1
  def destroy
    Channel.find(params[:id]).destroy  
    @workspace = Workspace.find(session[:curr_workspace_id])  
      redirect_to workspace_path(@workspace)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      @channel = Channel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def channel_params
      params.require(:channel).permit(:channel_name, :channel_type, :workspace_id)
    end
end
