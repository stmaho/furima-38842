FactoryBot.define do
  factory :item do
    name                {Faker::Name.name}
    content             {Faker::Lorem.sentence}
    price               {Faker::Number.between(from: 300, to: 9999999)}
    category_id         {Faker::Number.between(to: 5)}
    condition_id        {Faker::Number.between(to: 5)}
    shopping_cost_id    {Faker::Number.between(to: 5)}
    prefecture_id       {Faker::Number.between(to: 5)}
    preparation_id      {Faker::Number.between(to: 5)}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
