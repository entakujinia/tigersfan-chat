FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.name}
    email                  { Faker::Internet.free_email}
    password =             Faker::Internet.password(min_length: 5)
    password               { password }
    password_confirmation  { password }
    fan_history_id         { 2 }
    favorite_player_id     { 2 }
  end
end  