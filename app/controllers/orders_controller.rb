class OrdersController < ApplicationController
  def basket
    @order = current_user.orders.where(checked_out: false).first
  end
end
