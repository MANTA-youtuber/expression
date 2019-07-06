class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
   @user = User.find(params[:id])
   # ↓自分のトピックだけに限定
  @topics = current_user.topics.all

  def following
    @title = "フォロー"
    @user  = User.friendly.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "フォロワー"
    @user  = User.friendly.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end
 end

end
