class SessionController < ApplicationController

  # Don't check to see if a user is logged in before logging in!
  skip_before_filter :check_session, :only => :create

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

  # GET /session
  # Used to check if there is currently an active, valid user session
  # Will result in 401 unathorized if there is not one.
  def index
    # Use the check_session filter to perform the meat of this
    # Just return a success JSON result.
    render :json => { :status => "Logged In" }
  end
end
