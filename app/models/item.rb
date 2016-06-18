class Item < ActiveRecord::Base
  validates_presence_of :name, :price, :quantity, :description
  has_many :categories_items
  has_many :categories, through: :categories_items
  has_many :ordered_items

  def reduce_stock(amount)
    self.quantity = self.quantity - amount
    save
  end

  def buyout
    self.quantity = 0
    save
  end
end
