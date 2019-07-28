class WksinviteController < ApplicationController
    def index
        @users = User.where.not(id: current_user) 
        @workspace = Workspace.find(session[:curr_workspace_id]) 
        @channels=Channel.where(:workspace => session[:curr_workspace_id])   
        @member = Userworkspace.all.includes(:user).where(:role => "member", :workspace => session[:curr_workspace_id]) 
    end

    def update
        logger.info "-----update #{params[:id]} #{params[:channel_id]}------"
        @invite_user = User.find(params[:id])
        @invite_workspace = Workspace.find(params[:workspace_id])
        @is_invite = Userworkspace.find_by(user: @invite_user, workspace: @invite_workspace, role: "member")
        @is_uninvite = Userworkspace.find_by(user: @invite_user, workspace: @invite_workspace, role: "")   
     
        if @is_invite.nil? && @is_uninvite.nil?
            @curr_invite = Userworkspace.new(:user => @invite_user, :workspace => @invite_workspace, :role => "member")
            if @curr_invite.save
                redirect_to :action => 'index'
            end
        end
     
        if !@is_invite.nil?
            @is_invite.update_attribute(:role, "")
            redirect_to :action => 'index'
        end

        if !@is_uninvite.nil?
            @is_uninvite.update_attribute(:role, "member")
            redirect_to :action => 'index'
        end
    end
end

  