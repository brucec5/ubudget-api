class ApplicationController < ActionController::API
  before_filter :check_session

  # Get the current user from the session hash, if one exists
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # Checks to see if the user session is valid before doing any requests
  def check_session
    unless current_user
      render :json => { :status => "unauthroized" }, :status => :unauthorized
    end
  end
end
