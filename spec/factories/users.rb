FactoryBot.define do
  factory :user do
    email { 'test@example' }
    password { '1q2345' }
    password_confirmation { password }
    nickname { 'テスト' }
    first_name { '亞いウ' }
    family_name { 'え小' }
    first_name_ruby { 'アイウ' }
    family_name_ruby { 'エオ' }
    birth_day { Faker::Date }
  end
end
