require 'rails_helper'
require_relative '../support/auth_helper'

RSpec.feature "Items", type: :feature, js: true do
  before(:each) do
    @categories_item = create :categories_item
    @item = @categories_item.item
    @category = @categories_item.category
  end

  it "Shows a list of items" do
    visit category_path(@category)
    expect(page).to have_content(@categories_item.item.name)
  end

  it "displays a specific item" do
    visit item_path @item
    expect(page).to have_content(@item.name)
    expect(page).to have_content(@item.price)
    expect(page).to have_content(@item.description)
  end
end
