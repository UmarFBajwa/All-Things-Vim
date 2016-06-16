FactoryGirl.define do
  factory :categories_item do

  end

  factory :category do
    name "Category"
  end

  factory :user do
    name "Tim"
    email "tim@tim.com"
    password "timtim"

    factory :admin do
      admin { true  }
    end
  end


  factory :item do
    name { Faker::Name.name }
    price { rand(0..1000) }
    quantity { rand(1..20) }
    description { Faker::Lorem.sentence }
  end
end
