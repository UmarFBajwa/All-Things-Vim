class Order < ActiveRecord::Base
  belongs_to :user
  has_many :ordered_items
  has_many :items, through: :ordered_items
  validates_presence_of :user_id

  def total_items
    self.ordered_items.reduce(0){ |sum, ordered_item| sum += ordered_item.order_quantity }
  end

  def total_cost
    self.ordered_items.reduce(0) do |sum, ordered_item|
      sum += (ordered_item.order_quantity * ordered_item.item.price)
    end
  end
end
