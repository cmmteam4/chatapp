module WorkspacesHelper
    def set_workspace(workspace)
        session[:curr_workspace_id] = workspace.id
    end

    def get_workspace
        if session[:curr_workspace_id].nil?
            Workspace.find(session[:curr_workspace_id])
        end 
    end
end
