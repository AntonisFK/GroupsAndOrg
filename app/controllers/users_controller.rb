class UsersController < ApplicationController
  def index
    @user = User.new 

  end

  def create 
    user =  User.create(user_params)


    if user.errors.count == 0
      flash[:success] ="You have succesfull loged in"
      session[:user_id] = user.id 
      redirect_to login_path
    else 
      flash[:error] = user.errors.full_messages
      redirect_to '/'
    end
  end 
  
  def show
    @user = current_user 
    @groups = Group.all   
    @group = Group.new 
  end

  private 
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end 
end
