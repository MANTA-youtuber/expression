class GroupTopicsController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @group_topics = GroupTopic.all.includes(:group)
  end

  def new
    @group_topic = GroupTopic.new
    @group = Group.find(params[:group_id])
  end

  def show
    @topic = GroupTopic.find(params[:id])
    @comment = GroupComment.all.includes(params[:group_topic_id])
  end

  def create
    @group_topic = GroupTopic.new(group_topics)
    if @group_topic.save
      redirect_to  group_group_topics_path(@group_topic.group.id)
        flash[:success] = "投稿しました！"
    else
      redirect_to  new_group_group_topic_path(@group_topic.group.id)
      flash[:danger] = "投稿に失敗しました！"
    end
  end
end

private
def group_topics
  params.require(:group_topic).permit(:image, :description, :user_id, :title, :group_id)
end
