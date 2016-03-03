class GroupsController < ApplicationController
  before_action :require_login, only: [ :create, :destroy]
  
  def show
    @group = Group.find(params[:id])  
  end
  def create 
     @group = Group.create(group_params)
     op = Membership.create(group: @group, user: current_user)
     redirect_to current_user
  end

  def destroy 
    group = Group.find(params[:group_id])
    group.destroy
    redirect_to current_user
  end 

  private 
  def  group_params
    params.require(:group).permit(:name, :description).merge(user: current_user)
  end 
end
