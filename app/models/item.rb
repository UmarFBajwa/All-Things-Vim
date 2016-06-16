class Item < ActiveRecord::Base
  validates_presence_of :name, :price, :quantity, :description
  has_many :categories
  belongs_to :category
end
