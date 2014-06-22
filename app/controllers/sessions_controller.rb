class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password]) # has_secure_password built this in
  		session[:user_id] = user.id
  		redirect_to root_url, notice: "Logged in"
  	else
  		flash.now.alert = "Email or password is invalid"
  		render "new"
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url, notice: "You are now logged out"
  end

  private
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

end
