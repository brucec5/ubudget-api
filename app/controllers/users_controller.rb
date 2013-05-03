class UsersController < ApplicationController

  # Don't check if a user is logged in before creating a user
  skip_before_filter :check_session, :only => [:create]

  # GET /users
  # Keeping index and show around for now for debugging
  def index
    @users = User.all
    render :json => @users
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])

    render :json => @user
  end

  # POST /users
  # Create a new user if the user name is not taken.
  def create
    @user = User.new(:username => params[:username],
                     :password => params[:password])

    if @user.save
      session[:user_id] = @user.id
      render :json => @user, :status => :created, :location => @user
    else
      render :json => @user.errors, :status => :unprocessable_entity
    end
  end
end
