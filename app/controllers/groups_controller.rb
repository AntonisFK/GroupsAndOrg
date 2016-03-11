class GroupsController < ApplicationController

  
  def show
    @group = Group.find(params[:id])  
  end
  def create 
     @group = Group.create(group_params)
     op = Membership.create(group: @group, user: current_user)
     redirect_to current_user
  end

  def destroy 
    Group.where(id: params[:group_id]).destroy_all
    redirect_to current_user
  end 

  private 
  def  group_params
    params.require(:group).permit(:name, :description).merge(user: current_user)
  end 
end
