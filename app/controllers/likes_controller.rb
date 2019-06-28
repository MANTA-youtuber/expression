class LikesController < ApplicationController

  def create
    @like = current_user.likes.create(topic_id: params[:topic_id], user_id: current_user.id)
      redirect_back(fallback_location: root_path)
      @likes = Like.where(topic_id: params[:topic_id])
      @topics = Topic.all
  end

  def destroy
      @like = Like.find_by(user_id: current_user.id, topic_id: params[:topic_id])
      @like.destroy
      redirect_back(fallback_location: root_path)
      @likes = Like.where(topic_id: params[:topic_id])
      @topics = Topic.all

    end
end
