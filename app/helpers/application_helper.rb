module ApplicationHelper
  def logged_in
    session[:user_id] ? true : false
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
