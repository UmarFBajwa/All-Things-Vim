require 'faker'

Item.delete_all
CategoriesItem.delete_all

Category.delete_all
5.times do
  category = Category.create(name: Faker::Commerce.department)
  15.times do
    category.items.create( name: Faker::Commerce.product_name,
                          description: Faker::Company.catch_phrase,
                          image_url: 'http://lorempixel.com/400/200/',
                          quantity: (1..30).to_a.sample,
                          price: Faker::Commerce.price )
  end
end


User.delete_all
User.create(name: "Tom", email: "tom@tom.com", password: "tomtom")
User.create(name: "Tim", email: "tim@tim.com", password: "timtim", admin: true)


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
