class Category < ActiveRecord::Base
  validates_presence_of :name
  has_many :categories_items
  has_many :items, through: :categories_items
end
