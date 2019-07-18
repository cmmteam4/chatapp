class WorkspacesController < ApplicationController
    #before_action :set_workspace, only: [:show, :edit, :update, :destroy]
  
    # GET /workspaces
    
    def index
      @workspaces = Workspace.all

    end
  
    # GET /workspaces/1    
    def show
      @workspace = Workspace.find(params[:id])
      @channels = Channel.all
      @channels = Channel.where(:workspace => @workspace.id)   
      helpers.set_workspace @workspace
    end

    def workspace
    end

   def wksList    
     @workspaces = Workspace.all
     @workspacelist = User.all.find_by(id: current_user.id).workspaces      
     #if @workspacelist.nil?
     # redirect_to '/choose_workspace'
    #end
      
   end   
     
    # GET /workspaces/new
    def new
      @uworkspace = Userworkspace.new      
    end
  
    # GET /workspaces/1/edit
    def edit
      @workspace = Workspace.find(session[:curr_workspace_id])
    end
  
    # POST /workspaces    
    def create
      @uworkspace = userworkspace_params
      @workspace = Workspace.new(wks_name: @uworkspace['wks_name'])      
      if @workspace.save 
        @current = Workspace.last                  
        @userworkspace=Userworkspace.new(user_id: 1, workspace_id: @current.id, wks_name: @uworkspace['wks_name'], username: @uworkspace['username'], email: @uworkspace['email'], wks_password: @uworkspace['wks_password'], owner: "true")  
        if @userworkspace.save 
          helpers.set_workspace @workspace
          redirect_to @workspace, notice: 'Workspace was successfully created'  
        end
      end      
  end  
    
  
    # PATCH/PUT /workspaces/1    
    def update
      @workspace = Workspace.find(session[:curr_workspace_id])
      if @workspace.update_attributes(workspace_params)
      @userworkspace = Userworkspace.find_by(workspace_id: @workspace.id)
      @userworkspace.update_attribute(:wks_name, @workspace.wks_name)
      #flash[:success] = "Profile updated"
      redirect_to :action => "show", :id => @workspace.id      
      end      
    end
  
    # DELETE /workspaces/1    
    def destroy
      Workspace.destroy(params[:id])
      redirect_to '/choose_workspace', notice: 'Workspace was successfully deleted'      
    end

    def search
      @workspaces = Uworkspace.where(:email => params[:email])
      if !@workspaces.nil?
        render "search"      
      end
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
