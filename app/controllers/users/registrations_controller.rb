class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: :destroy

  def check_guest
    redirect_to root_path, alert: 'ゲストユーザーは削除不可です。' if resource.email == 'guestlogin@example.com'
  end
end
