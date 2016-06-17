FactoryGirl.define do
  factory :categories_item do

  end

  factory :category do
    name { Faker::Commerce.department  }
  end

  factory :user do
    name { Faker::Name.name  }
    email { Faker::Internet.email  }
    password { Faker::Internet.password  }
  end

  factory :admin, class: User do
    email { 'tim@tim.com'  }
    name { 'tim'  }
    password { 'timtim'  }
    admin { true  }
  end

  factory :item do
    name { Faker::Name.name }
    price { rand(0..1000) }
    quantity { rand(1..20) }
    description { Faker::Lorem.sentence }
  end
end
