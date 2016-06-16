class Item < ActiveRecord::Base
  validates_presence_of :name, :price, :quantity, :description
  has_many :categories_items
  has_many :categories, through: :categories_items
end
