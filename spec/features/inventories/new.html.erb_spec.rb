require 'rails_helper'

RSpec.describe 'inventories/new', type: :feature do
  before do
    @user = User.create(name: 'name', email: 'name@gmail.com', password: 'password')
    @user.save
    login_as(@user)
    visit new_inventory_path
    fill_in 'Name', with: 'Inventory2'
    fill_in 'Description', with: 'Inventory Description'
  end

  describe "Visit inventories' new page" do
    it 'should have title' do
      expect(page).to have_text('New inventory')
    end
    it 'should have name label' do
      expect(page).to have_text('Name')
    end

    it 'should have description label' do
      expect(page).to have_text('Description')
    end

    it 'should have create button' do
      expect(page).to have_selector(:link_or_button, 'Create Inventory', exact: true)
    end

    it 'should have index page link' do
      expect(page).to have_selector(:link_or_button, 'Back to inventories', exact: true)
    end

    it 'redirect to inventory index page' do
      click_link('Back to inventories', exact: true)
      expect(page).to have_current_path(inventories_path)
    end

    it 'redirect to index with success message' do
      click_button('Create Inventory', exact: true)
      expect(page).to have_current_path(inventories_path)
      expect(page).to have_text('Inventory was successfully created')
    end
  end
end
