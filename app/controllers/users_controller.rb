class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     redirect_to :mypage
    end
  end

  def mypage
    redirect_to user_path(current_user)
  end

  def accounts
    @user = current_user
  end

  def owner
    @owners = Room.where(user_id: current_user.id)
  end

  def reservations
    @reservations = current_user.reservations.includes(:room)
  end
end

  private
  def user_params
    params.require(:user).permit(:name , :email , :introduce , :image)
  end