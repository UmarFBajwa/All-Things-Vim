require 'rails_helper'

RSpec.describe CategoriesItem, type: :model do
  it { should belong_to :category }
  it { should belong_to :item }

  it 'should not allow duplicates' do
    category = create :category
    item = create :item
    expect {
      CategoriesItem.create(item_id: item.id, category_id: category.id)
    }.to change(CategoriesItem.all, :size).by(1)

    expect {
      CategoriesItem.create(item_id: item.id, category_id: category.id)
    }.not_to change(CategoriesItem.all, :size)
  end

  it 'factory is valid' do
    categories_item = create :categories_item

    expect(categories_item.valid?).to eq true
  end

  it 'factory creates an association with category' do
    categories_item = create :categories_item

    expect(categories_item.category).to be_a Category
  end

  it 'factory creates an association with an item' do
    categories_item = create :categories_item

    expect(categories_item.item).to be_an Item
  end
end
