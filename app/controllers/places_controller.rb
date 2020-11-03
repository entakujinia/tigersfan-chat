class PlacesController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :fan_history_id, :favorite_player_id)
  end
end
