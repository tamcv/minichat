class UsersController < ApplicationController
  def new
    @user = User.new(email: params[:email])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome #{@user.name}"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def add_friend
    @user = current_user
    @user.friend_list << params[:friend_id]
    if @user.save
      flash[:success] = "Added #{User.find(params[:friend_id]).name} to friend list"
    else
      flash[:error] = "Failed to add #{User.find(params[:friend_id]).name} to friend list"
    end
    redirect_to friends_path
  end

  def remove_friend
    @user = current_user
    remove_id = params[:remove_id].to_i
    @user.friend_list.delete(remove_id)
    if @user.save
      flash[:success] = "Remove #{User.find(remove_id).name} from friend list"
    else
      flash[:error] = "Failed to remove #{User.find(remove_id).name} from friend list"
    end
    redirect_to friends_path
  end

  def block
    @user = current_user
    block_id = params[:block_id].to_i
    @user.block_list << block_id
    if @user.save
      flash[:success] = "Added #{User.find(block_id).name} to block list"
    else
      flash[:error] = "Failed to add #{User.find(block_id).name} to block list"
    end
    redirect_to friends_path
  end

  def unblock
    @user = current_user
    unblock_id = params[:unblock_id].to_i
    @user.block_list.delete(unblock_id)
    if @user.save
      flash[:success] = "Remove #{User.find(unblock_id).name} from block list"
    else
      flash[:error] = "Failed to remove #{User.find(unblock_id).name} from block list"
    end
    redirect_to friends_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :password)
  end

end
