class OrdersController < ApplicationController
  def basket
    @order = current_user.orders.where(checked_out: false).first
  end

  def update
    message = []
    @order = current_user.orders.where(checked_out: false).first
    @order.ordered_items.each do |ordered_item|
      message << ordered_item.check_stock_availability
    end
    flash[:warning] = message.join(', ') +'.'
    @order.checked_out = true
    @order.save
    # Mail them
    # redirect_to thank_you_path
    redirect_to root_path
  end

end
