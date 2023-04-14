FactoryBot.define do
  factory :order_address do

    post_code           {Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    prefecture_id       {Faker::Number.between(to: 5)}
    city                {Faker::Address.city}
    address1            {Faker::Address.street_address}
    address2            {Faker::Address.secondary_address}
    phon_number         {Faker::Number.decimal_part(digits: 11)}
    token               { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end
