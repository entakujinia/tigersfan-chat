require 'rails_helper'
 describe User do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
   context '新規登録がうまくいくとき' do
    it 'nicknameとemail、passwordとpassword_confirmation、fan_historyとfavorite_playerが存在すれば登録できる' do
       expect(@user).to be_valid
     end
    end

    it 'nicknameがない場合は登録できないこと' do 
      @user.nickname = ''
      @user.valid?   
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailがない場合は登録できないこと' do
      @user.email = ''
      @user.valid?
    
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

     it 'passwordがない場合は登録できないこと' do
       @user.password = ''
       @user.valid? 
       expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
     end

     it 'password_confirmationがない場合は登録できないこと' do
       @user.password_confirmation = ''
       @user.valid?
       
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end

     it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
       @user.password_confirmation = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
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
       @user.password = '1234'
       @user.password_confirmation = '1234'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end

       it '重複したemailが存在する場合登録できないこと' do
         @user.save
         another_user = FactoryBot.build(:user)
         another_user.email = @user.email
         another_user.valid?
        expect(another_user.errors.full_messages).to include()
       end

     it 'fan_history_idが1の場合登録できないこと' do
       @user.fan_history_id = 1
       @user.valid?
       expect(@user.errors.full_messages).to include("Fan history must be other than 1")
     end

     it 'favorite_player_idが1の場合登録できないこと' do
       @user.favorite_player_id = 1
       @user.valid?     
       expect(@user.errors.full_messages).to include("Favorite player must be other than 1")
     end
  end
 end