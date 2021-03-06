class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @user = User.find(current_user.id)
    @topic = Topic.new
  end

  def new
    @topic = Topic.new
  end

  def show
    @topic = Topic.find( params[:id])
  end

  def create
    @topic = current_user.topics.new(topic_params)
    if @topic.save
      redirect_to topics_path, success: '投稿しました！'
    else
      flash.now[:danger] = "投稿に失敗しました！"
      render :new
    end
  end

  def destroy
    @topics = Topic.find_by(id: params[:id])
    @topics.destroy
    redirect_to topics_path
  end


  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
end
