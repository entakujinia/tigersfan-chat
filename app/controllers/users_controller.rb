class UsersController < ApplicationController

  def edit
    @user =User.all
  end

  def update 
    current_user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :fan_history_id, :favorite_player_id)
  end
end
 
