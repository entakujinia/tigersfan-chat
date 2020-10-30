require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
  
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、fan_historyとfavorite_playerが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    it 'nicknameがない場合は登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end

    it 'emailがない場合は登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end

    it 'passwordがない場合は登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end

    it 'password_confirmationがない場合は登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end
    it 'passwordは半角数字のみでは登録できないこと' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors[:password]).to include()
    end
    it 'passwordは半角英字のみでは登録できないこと' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors[:password]).to include()
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end
    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      second_user = FactoryBot.build(:user, email: @user.email, image: nil)
      second_user.valid?
      expect(second_user.errors.full_messages).to include()
    end

    it 'fan_history_idが1の場合登録できないこと' do
      @user.fan_history_id = 1
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end

    it 'favorite_player_idが1の場合登録できないこと' do
      @user.favorite_player_id = 1
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end
  end
end
