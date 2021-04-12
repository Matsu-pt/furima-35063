FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    email {Faker::Internet.free_email}
    password { 'qq12345' }
    password_confirmation { password }
    nickname { Faker::Name.name }
    first_name { person.first.kanji }
    family_name { person.last.kanji }
    first_name_ruby { person.first.katakana }
    family_name_ruby { person.last.katakana }
    birth_day { '1930-01-01' }
  end
end

