class SessionsController < ApplicationController
    def new        
    end
  
    def create
        logger.info "-----Create #{params[:id]}------"
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])       
            session[:user_id] = user.id
            flash[:notice] = t('Login successfully')
            redirect_to '/choose_workspace'
        else  
            flash[:alert] = t('Invalid email/password combination')
            render 'new'      
        end
    end

    def destroy      
        logger.info "-----Destroy #{params[:id]}------"
        if logged_in?
            session.delete(:user_id)
            @current_user = nil            
            redirect_to root_url
        end
    end
end
