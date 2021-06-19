FactoryBot.define do
  factory :purchase_address do
    card_token       {'tok_520ce447b26226864f9153508ede'}
    postal_code      {'111-1111'}
    prefecture_id    { 2 }
    city             {'テスト'}
    house_number     {'テスト1-1'}
    building_name    {'テスト301号室'}
    phone_number     {'09012345678'}
  end
end
