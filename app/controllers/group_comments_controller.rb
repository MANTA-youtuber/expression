class GroupCommentsController < ApplicationController
  def create
    @group_topic = GroupTopic.find(params[:group_topic_id])
    @group_topic.group_comments.create(comment_params)
    redirect_to group_topic_path(@group_topic)

    end

    private
    def comment_params
      params.require(:group_comment).permit(:content, :user_id, :group_topic_id)
    end
end
