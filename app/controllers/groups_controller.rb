class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
    @group.group_users.build
  end

  def show
    @group = Group.find(params[:id])
  end
  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_path(@group), success: 'グループ作成しました'
    else
      flash.now[:danger] = "作成に失敗しました"
      render :new

    end
  end


  def edite

  end

  def destroy

  end

  private
  def group_params
    params.require(:group).permit(:name, :description, :image, group_users_attributes: [:group_id, :user_id] )
  end

end
