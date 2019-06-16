class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:show, :edit]

  def show
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "profile was successfully updated."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) if @user != current_user
  end
end
