require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { build :item}
  context "#save" do
    it "returns true" do
      expect {
        item.save
        }.to change{Item.count}.by(1)
    end

    it "returns false if name is nil" do
      item.name = nil
      expect {
        item.save
        }.not_to change{Item.count}
    end

     it "returns false if price is nil" do
      item.price = nil
      expect {
        item.save
        }.not_to change{Item.count}
    end

     it "returns false if description is nil" do
      item.description = nil
      expect {
        item.save
        }.not_to change{Item.count}
    end

    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
    it { should validate_presence_of :description }
    it { should have_many :categories_items }
    it { should have_many :categories }
    it { should have_many :ordered_items }

    it '#reduce_amount reduces quanity by ordered_amount' do
      item = create :item
      expect{
        item.reduce_stock(1)
      }.to change{ item.quantity }.by(-1)
    end

    it '#buyout reduces quantity to 0' do
      item = create :item

      item.buyout

      expect(item.quantity).to eq 0
    end
  end
end
