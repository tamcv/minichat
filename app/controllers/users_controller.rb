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
    redirect_to add_friends_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :password)
  end

end
