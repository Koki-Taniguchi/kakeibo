class RecodesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recode, only: [:edit, :update, :destroy]

  def index
    @recode = Recode.new
    @all_recodes = Recode.search(params[:search], params[:start], params[:last], params[:bop], current_user).page(params[:page_1]).per(5)
  end

  def edit
    redirect_to user_path(current_user) if @recode.user_id != current_user.id
  end

  def create
    @recode = Recode.new(recode_params)
    @recode.user_id = current_user.id
    if @recode.save!
      flash[:notice] = "Recode was successfully created."
    else
      flash[:notice] = "created failed"
    end
    redirect_to recodes_path
  end

  def update
    if @recode.update(recode_params)
      flash[:notice] = "Recode was successfully updated."
      redirect_to recodes_path
    els
      render :edit
    end
  end

  def destroy
    if @recode.destroy
      flash[:notice] = "Recode was successfully destroyed."
    else
      flash[:notice] = "destroyed failed"
    end
    redirect_to recodes_path
  end

  private
    def set_recode
      @recode = Recode.find(params[:id])
    end

    def recode_params
      params.require(:recode).permit(:name, :category, :price, :bop).merge(date: params[:date])
    end
end
