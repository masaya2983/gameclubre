class Public::RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    current_member.follow(member)
  end

  def destroy
    @user = User.find(params[:user_id])
    current_memmber.unfollow(member)
  end

  def followings
    user =User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    member = Member.find(params[:user_id])
    @members = member.followers
  end
end
