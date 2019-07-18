class UsersController < ApplicationController
    def new
        @user = User.new
      end
    
      def create
        @user = User.new(name:params[:name],email:params[:email],password:params[:password])
        if @user.save
          log_in @user
          redirect_to root_url
         # Handle the success of saving here.
        else
          render 'new'
        end
      end
      private

      #def user_params
        #params.require(:user).permit(:name, :email, :password)
      #end
end
