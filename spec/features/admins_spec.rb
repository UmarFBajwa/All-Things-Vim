require 'rails_helper'
require_relative '../support/auth_helper'

RSpec.feature "Admins", type: :feature, js: true do
  before(:each) do
    @categories_item = create :categories_item
    @item = @categories_item.item
    @category = @categories_item.category
    @admin = create :admin
  end

  it "creates a new item" do
    page.set_rack_session(user_id: @admin.id)
    visit new_item_path
    fill_in 'item[name]', with: @item.name
    fill_in 'item[price]', with: @item.price
    fill_in 'item[quantity]', with: 2
    fill_in 'item[description]', with: @item.description
    fill_in "item[image_url]", with: "http://www.google.com"
    check("category-#{@category.id}")
    click_on('Create Product')
    expect(page).to have_content(@item.name)
  end

  it "displays a form and updates an existing item" do
    page.set_rack_session(user_id: @admin.id)
    visit edit_item_path(@item)
    fill_in 'item[name]', with: 'New name' 
    fill_in 'item[price]', with: 10.00
    click_on('Update Product')
    expect(page).to have_content('New name')
  end

  it "has a button that deletes the item" do
    page.set_rack_session(user_id: @admin.id)
    visit admin_path
    within(:css, "tr#item-#{@item.id}") do
      click_on('Delete')
    end
    page.driver.browser.switch_to.alert.accept
    expect(page).to_not have_content(@item.name)
  end

end
