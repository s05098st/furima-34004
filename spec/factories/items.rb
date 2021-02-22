FactoryBot.define do
  factory :item do
    name { 'テスト' }
    item_description { 'テストテスト' }
    category_id { 2 }
    item_condition_id { 2 }
    cost_id { 2 }
    prefecture_id { 2 }
    day_id { 2 }
    price { 967 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end