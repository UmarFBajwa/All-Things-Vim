class OrdersController < ApplicationController
  def basket
    @order = current_user.orders.where(checked_out: false).first
  end

  def update
    messages = []
    @order = current_user.orders.where(checked_out: false).first
    @order.ordered_items.each do |ordered_item|
      messages << ordered_item.check_stock_availability
    end

    flash[:warning] = messages.join(', ') unless messages.empty?
    @order.checked_out = true
    @order.save
    # Mail them
    # redirect_to thank_you_path
    redirect_to root_path
  end

  def index
    @orders = Order.where(user_id: current_user.id)
  end

end
