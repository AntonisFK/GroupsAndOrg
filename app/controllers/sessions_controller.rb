class SessionsController < ApplicationController
  def new
    @session = User.new 
  end

  def create 

  user = User.find_by(email:params[:user][:email])


  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id  
    redirect_to user 

  else 
    flash[:error] = 'Password or Email is invalid'
    redirect_to login_path
    end 
  end 

  def destroy
    session[:user_id] = nil 
    redirect_to '/'
   end 
end
