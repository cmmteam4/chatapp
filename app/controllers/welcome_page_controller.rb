class WelcomePageController < ApplicationController
  def home    
  end
  
  def about
    @workspace=Workspace.find(session[:curr_workspace_id])
    @channels=Channel.where(:workspace => session[:curr_workspace_id])
    @member = Userworkspace.all.includes(:user).where(:role => "member", :workspace => session[:curr_workspace_id])
   end
end
