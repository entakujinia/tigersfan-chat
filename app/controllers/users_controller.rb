class UsersController < ApplicationController

  def edit
    @user =User.all

  end

  def update 
    @user = User.find(params[:id])
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
  end


  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :fan_history_id, :favorite_player_id)
  end
end
 
