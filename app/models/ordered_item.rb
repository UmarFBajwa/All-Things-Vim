class OrderedItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :order
  validates_presence_of :order_quantity, :item_id, :order_id

  def check_stock_availability
    stock = item.quantity
    amount = order_quantity
    if stock > amount
      item.reduce_stock(amount)
    else
      item.buyout
      message = "We couldn't order #{amount-stock} of #{item.name}"
      order_quantity = stock
    end
    save
    message
  end

  def total_cost
    self.item.price * self.order_quantity
  end



end
