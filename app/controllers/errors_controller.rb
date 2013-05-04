class ErrorsController < ApplicationController

  # Called whenever a resource is not found
  def not_found
    render :json => { :error => "Resource Not Found" }, :status => 404
  end

  # Called upon generic 500 errors
  def server_error
    render :json => { :error => "Internal Server Error" }, :status => 500
  end
end
