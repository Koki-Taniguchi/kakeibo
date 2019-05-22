class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:show, :edit]

  def show
    @recode = Recode.new
    @all_recodes = Recode.search(params[:search], params[:start], params[:last], current_user).page(params[:page_1]).per(5)

    this_year_range = Date.today.beginning_of_year..Date.today.end_of_year
    @this_year_recodes = Recode.where(user_id: current_user.id).where(date: this_year_range).page(params[:page_2]).per(5).order(date: "DESC")

    this_month_range = Date.today.beginning_of_month..Date.today.end_of_month
    @this_month_recodes = Recode.where(user_id: current_user.id).where(date: this_month_range).page(params[:page_3]).per(5).order(date: "DESC")

    this_week_range = Date.today.beginning_of_week..Date.today.end_of_week
    @this_week_recodes = Recode.where(user_id: current_user.id).where(date: this_week_range).page(params[:page_4]).per(5).order(date: "DESC")
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
