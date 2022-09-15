require 'rails_helper'

RSpec.describe 'inventories/show', type: :feature do
  before do
    @user = User.create(name: 'name', email: 'name@gmail.com', password: 'password')
    @user.save
    login_as(@user)
    @inventory = Inventory.create(name: "Inventory 1",description: "description", user: @user)
    @food = Food.create(name: "Cake", measurment_unit: 'gram', price: 50)
    @inventory.save
    @food.save
    @inventory_food = InventoryFood.create(quantity: 65, inventory: @inventory, food: @food)
    visit inventory_path(@inventory)
  end

  describe "Visit inventories' show page" do

    it 'should have inventory name header' do
      expect(page).to have_text('Inventory 1')
    end

    it 'should have quantity title' do
      expect(page).to have_text('Quantity')
    end

    it 'should have Action title' do
      expect(page).to have_text('Actions')
    end

    it 'should have inventory quantity' do
      expect(page).to have_text(65)
    end

    it 'should have food name' do
      expect(page).to have_text('Cake')
    end

    it 'should have food measurement' do
      expect(page).to have_text('gram')
    end

    it 'should have delete button' do
      expect(page).to have_selector(:link_or_button, 'Remove', exact: true)
    end

    it 'should have link to add food' do
      expect(page).to have_selector(:link_or_button, 'Add Food', exact: true)
    end

    it 'redirect to add food in inventory page' do
      click_link('Add Food', exact: true)
      expect(page).to have_current_path(new_inventory_inventory_food_path(@inventory))
    end

    it 'should delete food from inventory' do
      click_button('Remove', exact: true)
      expect(page).to have_text('Inventory food was successfully destroyed')
    end

  end
end
