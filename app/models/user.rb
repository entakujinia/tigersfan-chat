class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX }, allow_blank: true
  validates :nickname,        presence: true
  validates :fan_history,     presence: true
  validates :favorite_player, presence: true

  has_many :room_users, dependent: :destroy
  has_many :rooms, through: :room_users, dependent: :destroy
  has_many :messages

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :fan_history
  belongs_to_active_hash :favorite_player
  validates :fan_history_id, numericality: { other_than: 1 }
  validates :favorite_player_id, numericality: { other_than: 1 }

  def self.guest
    find_or_create_by!(nickname: '篠谷拓', email: 'guestuser@example.com') do |user|
      user.password = Faker::Internet.password(min_length: 6)
      user.fan_history_id = 2
      user.favorite_player_id = 2
    end
  end
end
