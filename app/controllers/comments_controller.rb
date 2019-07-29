class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @topic.comments.create(comment_params)
    redirect_to topic_path(@topic)
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :topic_id)
  end
end
