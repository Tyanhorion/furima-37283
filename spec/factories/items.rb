FactoryBot.define do
  factory :item do
    item_name       {Faker::Lorem.sentence}
    explanation     {Faker::Lorem.sentence}
    image           {Faker::Lorem.sentence}
    price           {"300"}
    delivery_id     {2}
    prefecture_id   {2}
    category_id     {2}
    situation_id    {2}
    shipping_day_id {2}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
