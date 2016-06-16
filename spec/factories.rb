FactoryGirl.define do
  factory :category_item do
    
  end
  factory :category do
    
  end
  factory :user do
    name "MyString"
    email "MyString"
    password_digest "MyString"
  end
  # factory :admin do

  # end

  factory :item do
    name { Faker::Name.name }
    price { rand(0..1000) }
    quantity { rand(1..20) }
    description { Faker::Lorem.sentence }
  end
end
