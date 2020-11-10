class UsersController < ApplicationController
  def edit
    @user = User.all
  end

  def update
    redirect_to root_path, alert: 'ゲストユーザーは編集・削除できません。' and return if current_user.email == 'guestuser@example.com'
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :fan_history_id, :favorite_player_id)
  end
end
