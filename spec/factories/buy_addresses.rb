FactoryBot.define do
  factory :buy_address do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    municipalities { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    telephone {'09012345678'}
  end
end
