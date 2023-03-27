FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name	          {Gimei.family.kanji }
    first_name	          {Gimei.first.kanji }
    read_family	          {Gimei.family.katakana }
    read_first		        {Gimei.first.katakana }
    birth_day	            {Faker::Date.between(from: '1930-01-01', to: 5.years.ago)}
   
  end
end