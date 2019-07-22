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
          redirect_to root_url        
        else          
          #flash[:alert] = "Please enter your Email!!"
          redirect_to '/signup'
        end
      end

    #   def show
    #    @user = User.find(params[:id])
    #  end
     
      def update
        @users = User.find(session[:user_id])
        if @users.update_attributes(name:params[:name],email:params[:email],password:params[:password])
          flash[:notice] = "Profile updated"
          redirect_to '/edit'
          # dealing with the case of a successful # update
        # else
        #   render 'edit'
        end
      end
      private
       
      # def user_params
      #   @users.update_attributes(name:params[:name],email:params[:email],password:params[:password])
      # end
end
