require 'rails_helper'

RSpec.feature "Items", type: :feature, js: true do
  let!(:item) {create :item}

  it "Shows a list of items" do
    visit root_path
    expect(page).to have_content(item.name)
  end
  context "Create A New Item" do
    it "creates a new item" do
      visit root_path
      fill_in 'Name', with: item.name
      fill_in 'Price', with: item.price
      fill_in 'Description', with: item.description
      click_on('Create A New Item')
      expect(page).to have_content(item.description)
    end
  end

  describe "item page" do
    before(:each) do
      visit item_path(item.id)
    end

    it "displays a form and updates an existing post" do
      new_name = "Danny"
      fill_in('Name', with: new_name)
      click_on('Update')
      expect(page).to have_content(new_name)
    end
    it "has a button that deletes the item" do
      click_on('Delete item')
      expect(page).to_not have_content(item.name)
    end
  end
end
