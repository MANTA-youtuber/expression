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

  def edit
    @group = Group.find(params[:id])

  end
  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    redirect_to group_path(@group)
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


  def destroy
    @groups = Group.find_by(id: params[:id])
    @groups.destroy
    redirect_to groups_path
  end

  private
  def group_params
    params.require(:group).permit(:name, :description, :image, :user_id, group_users_attributes: [:group_id, :user_id] )
  end

end
