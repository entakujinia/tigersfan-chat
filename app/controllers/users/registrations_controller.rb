class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: :destroy

  def check_guest
    if resource.email == 'login_guest@example.com'
       redirect_to root_path, alert: 'ゲストユーザーは削除不可です。'
    end
  end
end