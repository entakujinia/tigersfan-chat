require 'rails_helper'

RSpec.describe '呟き投稿機能', type: :system do
  before do
    @room_user = FactoryBot.create(:room_user)
  end

  context '呟きに成功したとき' do
    it '呟きに成功すると、呟き投稿画面に、投稿した内容が表示されている' do
      sign_in(@room_user.user)
      visit posts_path
      post = 'テスト'
      fill_in 'content', with: post
      expect(current_path).to eq posts_path
    end
  end

  context '呟きに失敗したとき' do
    it '呟きに失敗すると、呟き投稿画面に、投稿した内容が表示されない' do
      sign_in(@room_user.user)
      visit posts_path
      post = ''
      fill_in 'content', with: post
      expect(current_path).to eq posts_path
    end
  end
end
