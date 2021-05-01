FactoryBot.define do
  factory :user do
    nickname              {'テスト'}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)} 
    password_confirmation {password}
    last_name             {'てすと'}
    first_name            {'太郎'}
    last_name_kana        {'テスト'}
    first_name_kana       {'タロウ'}
    birth_day             {'1994-07-13'}
  end
end