require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context 'ユーザー新規登録ができるとき' do
     it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      visit new_user_registration_path
      fill_in 'user_nickname', with: @user.nickname
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      fill_in 'user_password_confirmation', with: @user.password_confirmation
      select '10年以上', from: "user[fan_history_id]"
      select '藤川球児', from: "user[favorite_player_id]"
      expect{
       find('input[name="commit"]').click
       }.to change { User.count }.by(1)
      expect(current_path).to eq root_path
     end
    end
    context 'ユーザー新規登録ができないとき' do
     it '誤った情報ではユーザー新規登録ができない' do
      visit new_user_registration_path
      fill_in 'user_nickname', with: ''
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
      fill_in 'user_password_confirmation', with: ''
      expect{
       find('input[name="commit"]').click
       }.to change {User.count}.by(0)
     end
     it 'ファン歴と好きな選手を設定しなければユーザー新規登録ができない' do
      visit new_user_registration_path
      select '--', from: "user[fan_history_id]"
      select '--', from: "user[favorite_player_id]"
      expect{
       find('input[name="commit"]').click
       }.to change {User.count}.by(0)
     end
    end
  end
end
