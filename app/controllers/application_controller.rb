class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token

  def authenticate_admin
      unless current_user && current_user.admin
        flash[:warning] = "Not an admin, sorry"
        redirect_to '/'
      end
  end

  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
