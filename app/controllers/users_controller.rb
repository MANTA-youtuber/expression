class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
   @user = User.find(params[:id])
   # ↓自分のトピックだけに限定
  @topics = current_user.topics.all
 end

end
