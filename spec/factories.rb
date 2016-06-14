FactoryGirl.define do
  factory :item do
    name { Faker::Name.name }
    price { rand(0..1000) }
    quantity { rand(1..20) }
    description { Faker::Lorem.sentence }
  end
end
