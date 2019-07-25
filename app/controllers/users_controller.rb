class UsersController < ApplicationController

     def show
       @user = User.find(params[:id])
    end

    def new
        @user = User.new
      end

      def edit
        @users = User.find(session[:user_id])
        @workspace = Workspace.find(session[:curr_workspace_id])
      end
    
      def create
        @user = User.new(name:params[:name],email:params[:email],password:params[:password])
        if @user.save
          log_in @user
          flash[:notice] = t('Login your account!!')
          redirect_to root_url        
        else          
          flash[:alert] = t('Please enter your information completely!!')
          redirect_to '/signup'
        end
      end

     
      def update
        @users = User.find(session[:user_id])
        if @users.update_attributes(name:params[:name],email:params[:email],password:params[:password],password_confirmation:params[:password_confirmation])
          flash[:notice] = t('Profile updated')
          redirect_to '/edit'
          # dealing with the case of a successful # update
        else
          flash[:alert] = t('Update Failed')
          redirect_to '/edit'
        end
      end
     
end
