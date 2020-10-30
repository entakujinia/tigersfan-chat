class User < ApplicationRecord 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
  validates :nickname,        presence: true
  validates :fan_history,     presence: true
  validates :favorite_player, presence: true
  
  #has_many :room_users
  #has_many :rooms, through: room_users
  #has_many :messages

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :fan_history
  belongs_to_active_hash :favorite_player
  validates :fan_history_id, numericality: { other_than: 1 }
  validates :favorite_player_id, numericality: { other_than: 1 }
  
  def self.guest
    find_or_create_by!(email: 'guestlogin@example.com') do |user|
      user.nickname = SecureRandom.urlsafe_base64
      user.password = SecureRandom.urlsafe_base64
      user.fan_history_id = SecureRandom.urlsafe_base64
      user.favorite_player_id = SecureRandom.urlsafe_base64
    end
  end
end
