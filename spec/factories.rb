FactoryGirl.define do
  factory :item do
    name { Faker::Name.name }
    price { rand(0..1000) }
    description { Faker::Lorem.sentence }
  end
end
