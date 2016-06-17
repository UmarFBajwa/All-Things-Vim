class OrderedItemsController < ApplicationController
  def create
    if current_user.orders.empty? || current_user.orders.last.checked_out
      order = Order.create(user_id: current_user.id)
    else
      order = current_user.orders.last
    end
      basket_item = OrderedItem.new(ordered_item_params)
      basket_item.order_id = order.id
      basket_item.save
    if request.xhr?
      render :create, layout: false
    else
      flash[:success] = 'You successfully added that item to the cart.'
      redirect_to root_path
    end
  end

  private

  def ordered_item_params
    params.require(:ordered_item).permit(:order_id, :item_id, :order_quantity)
  end
end
