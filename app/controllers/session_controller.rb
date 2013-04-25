class SessionController < ApplicationController
  def create
    user = User.authenticate(params[:name], params[:password])
    if user
      session[:user_id] = user.id
      render :json => user
    else
      render :json => { :login => "Bad username/password" }, :status => :unauthroized
    end
  end
end
