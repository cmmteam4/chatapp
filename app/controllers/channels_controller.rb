class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :edit, :update, :destroy]   
    
  # GET /channels
  def index
    logger.info "-----index ------"
    @channels = Channel.all
  end

  # GET /channels/
  def show 
    logger.info "-----Show #{params[:id]}------"
    @channel=Channel.find(params[:id])
    @workspace=Workspace.find(session[:curr_workspace_id])
    @channels=Channel.where(:workspace => session[:curr_workspace_id])
    @message = Message.new
    @messages = Message.all.includes(:user).where(:channel => @channel.id)
    #@thread = Thread.new
    #@threadlist = Thread.all
    helpers.set_channel @channel   
    @member = Userworkspace.all.includes(:user).where(:role => "member", :workspace => session[:curr_workspace_id])
  end 
  
  # GET /channels/new
  def new
    logger.info "-----New------"
    @channel = Channel.new
    @workspace = Workspace.find(session[:curr_workspace_id])    
  end

  # GET /channels/1/edit
  def edit    
    logger.info "-----Edit #{params[:email]}------"
    @channel = Channel.find(params[:id])
    @workspace = Workspace.find(session[:curr_workspace_id])
  end

  # POST /channels  
  def create    
    logger.info "-----Create #{params[:email]}------"  
    @channel = Channel.new(channel_name:params[:channel_name],channel_type:params[:channel_type],workspace_id:params[:workspace_id])
    if @channel.save          
      @current=Channel.last
      @uchannel=Invite.new(user_id: current_user.id, channel_id: @current.id, role: "owner")
      @uchannel.save   
      @workspace = Workspace.all
      @workspace = Workspace.find(session[:curr_workspace_id])
      redirect_to workspace_path(@workspace) 
    else
      flash[:alert] = t('Please insert Channel Name!!')
      redirect_to new_channel_path(@workspace)
    end
  end

  # PATCH/PUT /channels/1
  def update
    logger.info "-----Update #{params[:id]}------"
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
    logger.info "-----Destroy #{params[:id]}------"
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
