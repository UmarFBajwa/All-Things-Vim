require 'rails_helper'

RSpec.feature "Items", type: :feature, js: true do
  let!(:item) {create :item}

  it "Shows a list of items" do
    visit root_path
    expect(page).to have_content(item.name)
  end

  it "creates a new item" do
    visit new_item_path
    fill_in 'Name', with: item.name
    fill_in 'Price', with: item.price
    fill_in 'Description', with: item.description
    click_on('Submit')
    expect(page).to have_content(item.name.upcase)

  end

  before(:each) do
    visit root_path
  end

  it "displays a specific item" do
    click_on('Show')
    expect(page).to have_content(item.name.upcase)
    expect(page).to have_content(item.price)
    expect(page).to have_content(item.description)
  end

  it "displays a form and updates an existing item" do
    new_price = "DANNY"
    click_on('Edit')
    visit edit_item_path(item.id)
    fill_in('Name', with: new_price)
    click_on('Submit')
    expect(page).to have_content(new_price)
  end
  it "has a button that deletes the item" do
    click_on('Delete')
    page.driver.browser.switch_to.alert.accept
    expect(page).to_not have_content(item.name)
  end

end
