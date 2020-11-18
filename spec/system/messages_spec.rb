require 'rails_helper'

RSpec.describe "メッセージ投稿機能", type: :system do
  before do
    @room_user = FactoryBot.create(:room_user)
  end

  context '投稿に成功したとき' do
    it 'テキストの投稿に成功すると、チャット画面に、投稿した内容が表示されている' do
      sign_in(@room_user.user)
      visit  rooms_path
      click_on(@room_user.room.name)
      post = "テスト"
      fill_in 'message_content', with: post
      expect {
        find('input[name="commit"]').click
      }.to change { Message.count }.by(1)
      expect(current_path).to eq room_messages_path(@room_user.room)
      expect(page).to have_content(post)
    end
  end
  context '投稿に失敗したとき' do
    it '送る値が空の為、テキストの送信に失敗すること' do
      sign_in(@room_user.user)
      visit  rooms_path
      click_on(@room_user.room.name)
      expect {
        find('input[name="commit"]').click
      }.not_to change { Message.count }
      expect(current_path).to eq  room_messages_path(@room_user.room)
    end
  end
end