require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'チャットルーム作成' do
    before do
      @room = FactoryBot.build(:room)
    end

    it 'nameの値が存在すれば登録できること' do
      expect(@room).to be_valid
    end

    it 'nameが空では登録できないこと' do
      @room.name = ''
      @room.valid?
      expect(@room.errors.full_messages).to include("Nameを入力してください")
    end
  end
end