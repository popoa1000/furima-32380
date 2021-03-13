FactoryBot.define do
  factory :item do
    product           { Faker::Lorem.sentence }
    description       { Faker::Lorem.sentence }
    category_id       { Faker::Number.between(from: 2, to: 11) }
    condition_id      { Faker::Number.between(from: 2, to: 11) }
    charge_id         { Faker::Number.between(from: 2, to: 11) }
    shipment_id       { Faker::Number.between(from: 2, to: 11) }
    day_id            { Faker::Number.between(from: 2, to: 11) }
    price             { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
