require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to :user }
  it { should have_many :ordered_items }
  it { should have_many(:items).through(:ordered_items) }
  it { should validate_presence_of :user_id }

  it 'factory is valid' do
    order = create :order

    expect(order.valid?).to eq true
  end

  it 'factory creates an order associated with a user' do
    order = create :order

    expect(order.user).to be_a User
  end

end
