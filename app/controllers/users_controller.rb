class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]

    def show
      @user = User.find(params[:id])
    end

    def new
      logger.info "-----New------"
      @user = User.new
    end

    def edit
      logger.info "-----Edit #{params[:email]}------"
      @users = User.find(session[:user_id])
      @workspace = Workspace.find(session[:curr_workspace_id])
    end
    
    def create
      logger.info "-----Create #{params[:id]}------"
      @user = User.new(user_params)
      if @user.save
        log_in @user
        flash[:notice] = t('Login your account!!')
        redirect_to root_url        
      else          
        flash[:alert] = t('Please enter your information completely!!')
        redirect_to new_user_path
      end
    end
     
    def update
      logger.info "-----Update #{params[:id]}------"
      @users = User.find(session[:user_id])
      if @users.update_attributes(user_params)
        flash[:notice] = t('Profile updated')
        redirect_to '/edit'        
      else
        flash[:alert] = t('Update Failed')
        redirect_to '/edit'
      end
    end   

    private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end     

    def correct_user
      @user = User.find(session[:user_id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
