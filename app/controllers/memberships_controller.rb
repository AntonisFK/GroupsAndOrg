class MembershipsController < ApplicationController
  before_action :require_login, only: [:create, :destroy]

  def create 
    @group = Group.find(params[:group_id])
    membership = Membership.create(group: @group, user:current_user)
    redirect_to @group
  end 

  def destroy 
    @group = Group.find(params[:group_id])
    membership = Membership.where("group_id = ? AND user_id = ?",  @group , current_user)
    membership[0].destroy
    redirect_to  current_user
  end 

end
