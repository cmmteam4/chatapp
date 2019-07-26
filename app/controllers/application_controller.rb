class ApplicationController < ActionController::Base
    include SessionsHelper
    before_action :set_locale

    
  def set_locale
    I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end  

  def default_url_options
    { locale: I18n.locale }
  end

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:alert] = "You must login!!"
      redirect_to '/login'
    end
  end
end
