FactoryBot.define do
  factory :purchase_address do
    postal_code      {'111-1111'}
    prefecture_id    { 2 }
    city             {'テスト'}
    house_number     {'テスト1-1'}
    phone_number     {'09012345678'}
  end
end
