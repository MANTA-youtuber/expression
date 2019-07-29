class LikesController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @like = current_user.likes.create(topic_id: params[:topic_id], user_id: current_user.id)
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @like = Like.find_by(topic_id: params[:topic_id], user_id: current_user.id)
    @like.destroy
    # redirect_back(fallback_location: root_path)
  end
end
