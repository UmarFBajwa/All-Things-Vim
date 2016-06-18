class OrdersController < ApplicationController
  def basket
    @order = current_user.orders.where(checked_out: false).first
  end

  def update
    message = []
    @order = current_user.orders.where(checked_out: false).first
    @order.ordered_items.each do |ordered_item|
      stock = ordered_item.item.quantity
      amount = ordered_item.order_quantity
      if stock > amount
        ordered_item.item.quantity -= amount
      else
        message << "We couldn't order #{amount-stock} of #{ordered_item.item.name}"
        ordered_item.order_quantity = stock
        ordered_item.item.quantity = 0
      end
      ordered_item.item.save
      ordered_item.save
    end
    flash[:warning] = message.join(', ') +'.'
    @order.checked_out = true
    @order.save
    # Mail them
    # redirect_to thank_you_path
    redirect_to root_path
  end
end
