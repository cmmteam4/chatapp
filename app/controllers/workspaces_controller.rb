class WorkspacesController < ApplicationController 
    # GET /workspaces    
    def index
      @workspaces = Workspace.all
    end
  
    # GET /workspaces/1    
    def show
      logger.info "-----Show #{params[:id]}------"
      @workspace = Workspace.find(params[:id])
      @channels = Channel.all
      @channels = Channel.where(:workspace => @workspace.id)   
      helpers.set_workspace @workspace
      @member = Userworkspace.all.includes(:user).where(:role => "member", :workspace => session[:curr_workspace_id])
    end

    def workspace
    end

    # pagination
    def wksList        
      @workspacelist = User.all.find_by(id: current_user.id).workspaces.page(params[:page]).per(4)      
      #@users = User.order(:name).page params[:page]      
    end   
     
    # GET /workspaces/new
    def new
      logger.info "-----New------"
      @uworkspace = Userworkspace.new      
    end
  
    # GET /workspaces/1/edit
    def edit
      @workspace = Workspace.find(session[:curr_workspace_id])
    end
  
    # POST /workspaces    
    def create
      logger.info "-----Create #{params[:id]}------"
      @uworkspace = userworkspace_params
      @workspace = Workspace.new(wks_name: @uworkspace['wks_name'])      
      if @workspace.save 
        @current = Workspace.last                  
        @userworkspace=Userworkspace.new(user_id: current_user.id, workspace_id: @current.id, wks_name: @uworkspace['wks_name'], username: @uworkspace['username'], email: @uworkspace['email'], wks_password: @uworkspace['wks_password'], owner: "true")  
        @userworkspace.save 
        helpers.set_workspace @workspace          
        redirect_to @workspace, notice: 'Workspace was successfully created'          
      else
        flash[:notice] = t('Please enter your information completely!!')
        redirect_to new_workspace_path
      end 
    end      
  
    # PATCH/PUT /workspaces/1    
    def update
      logger.info "-----Update #{params[:id]}------"
      @workspace = Workspace.find(session[:curr_workspace_id])
      if @workspace.update_attributes(workspace_params)
        @userworkspace = Userworkspace.find_by(workspace_id: @workspace.id)
        @userworkspace.update_attribute(:wks_name, @workspace.wks_name)
        #flash[:notice] = "Workspace updated"
        redirect_to :action => "show", :id => @workspace.id      
      else
        flash[:alert] = t('Workspacename is blank')
        redirect_to edit_workspace_path(:id => @workspace.id)
      end      
    end
  
    # DELETE /workspaces/1    
    def destroy
      logger.info "-----Destroy #{params[:id]}------"
      Workspace.destroy(params[:id])
      redirect_to '/choose_workspace', notice: 'Workspace was successfully deleted'      
    end 
  
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_workspace
      @workspace = Workspace.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workspace_params
      params.require(:workspace).permit(:wks_name)
    end

    def userworkspace_params
      params.require(:userworkspace).permit(:wks_name, :user_id, :workspace_id, :username, :email, :wks_password, :owner)
    end
end
