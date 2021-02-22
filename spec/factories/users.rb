FactoryBot.define do
  # password = 'NM8211Ukt'
  factory :user do
    nickname { 'test' }
    email { Faker::Internet.free_email}
    password { "1aaaaa" }
    password_confirmation { password }
    first_name { '太郎' }
    family_name { '山田' }
    first_name_kana { 'タロウ' }
    family_name_kana { 'ヤマダ' }
    birth_day { '1930-01-01' }
  end
end