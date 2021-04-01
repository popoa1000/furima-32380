FactoryBot.define do
  factory :buyer_order do
    postal_code { '012-3456' }
    shipment_id { Faker::Number.between(from: 2, to: 11) }
    municipality { Faker::Address.city }
    address { Faker::Address.community }
    building { Faker::Lorem.sentence }
    phone_number { Faker::Number.leading_zero_number(digits: 10 || 11) }
    token { Faker::Code.nric }
  end
end
