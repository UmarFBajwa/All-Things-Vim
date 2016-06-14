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

    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
    it { should validate_presence_of :description }
  end
end
