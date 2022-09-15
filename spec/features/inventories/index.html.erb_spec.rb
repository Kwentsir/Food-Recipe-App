require 'rails_helper'

RSpec.describe 'inventories/index', type: :feature do
  before do
    @user = User.create(name: 'name', email: 'name@gmail.com', password: 'password')
    @user.save
    login_as(@user)
    @inventory = Inventory.create(name: "Inventory 1",description: "Inventory description", user: @user)
    visit inventories_path
  end

  describe "Visit inventories' index page" do

    it 'should have inventory name' do
      expect(page).to have_text('Inventory 1')
    end

    it 'should have inventory description' do
      expect(page).to have_text('Inventory description')
    end

    it 'should have delete button' do
      expect(page).to have_selector(:link_or_button, 'REMOVE', exact: true)
    end

    it 'should have new page link' do
      expect(page).to have_selector(:link_or_button, 'Create new inventory', exact: true)
    end

    it 'redirect to details page' do
      click_link(@inventory.name)
      expect(page).to have_current_path(inventory_path(@inventory))
    end

    it 'redirect to add new inventory' do
      click_link("Create new inventory", exact: true)
      expect(page).to have_current_path(new_inventory_path)
    end

    it 'should delete inventory' do
      click_button('REMOVE', exact: true)
      expect(page).to have_text('Inventory was successfully destroyed')
    end

  end
end
