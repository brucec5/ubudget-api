class SessionController < ApplicationController

  # Don't check to see if a user is logged in before loggin in!
  skip_before_filter :check_session

  # POST /session
  # Used for login
  # Sets the session cookie to be stored by the app and passed to subsequent requests.
  def create
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      render :json => user
    else
      render :json => { :login => "Bad username/password" }, :status => :unauthroized
    end
  end
end
