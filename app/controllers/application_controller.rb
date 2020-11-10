class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def check_guest
    email = resource.email
    redirect_to root_path, alert: 'ゲストユーザーの変更・削除は不可です。' if email == 'guestuser@example.com'
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :fan_history_id, :favorite_player_id])
  end
end
