class Item < ActiveRecord::Base
  validates_presence_of :name, :price, :quantity, :description
end
