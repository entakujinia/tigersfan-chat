require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'リアルタイム投稿しよう' do
    before do
      @post = FactoryBot.build(:post)
    end

    it 'contentの値が存在すれば登録できること' do
      expect(@post).to be_valid
    end

    it 'contentが空では登録できないこと' do
      @post.content = nil
      @post.valid?
      binding.pry
      expect(@post.errors.full_messages).to include("Contentを入力してください"])
    end
  end
end