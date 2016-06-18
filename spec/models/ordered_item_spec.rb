require 'rails_helper'

RSpec.describe OrderedItem, type: :model do
  it { should belong_to :item }
  it { should belong_to :order }
  it { should validate_presence_of :order_quantity }
  it { should validate_presence_of :item_id }
  it { should validate_presence_of :order_id }

  it 'factory is valid' do
    ordered_item = create :ordered_item

    expect(ordered_item.valid?).to eq true
  end

  it 'factory creates association with an item' do
    ordered_item = create :ordered_item

    expect(ordered_item.item).to be_an Item
  end

  it 'factory creates association with an order' do
    ordered_item = create :ordered_item

    expect(ordered_item.order).to be_an Order
  end
end
