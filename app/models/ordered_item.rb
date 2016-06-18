class OrderedItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :order
  validates_presence_of :order_quantity, :item_id, :order_id
end
