require 'rails_helper'

RSpec.describe 'inventory_foods/new', type: :feature do
  before do
    @user = User.create(name: 'name', email: 'name@gmail.com', password: 'password')
    @user.save
    login_as(@user)
    @inventory = Inventory.create(name: 'Inventory 1', description: 'description', user: @user)
    @food = Food.create(name: 'Cake', measurment_unit: 'gram', price: 50)
    @inventory.save
    @food.save
    visit new_inventory_inventory_food_path(@inventory)
    fill_in 'Quantity', with: 65
  end

  describe "Visit inventory_food' new page" do
    it 'should have header' do
      expect(page).to have_text('New Inventory Food')
    end

    it 'should have quantity label' do
      expect(page).to have_text('Quantity')
    end

    it 'should have food selection label' do
      expect(page).to have_text('Select food')
    end

    it 'should have current food name' do
      expect(page).to have_text('Cake')
    end

    it 'should have create button' do
      expect(page).to have_selector(:link_or_button, 'Add Food To Inventory', exact: true)
    end

    it 'should have link to add new food in food list' do
      expect(page).to have_selector(:link_or_button, 'You can add new food in food store here', exact: true)
    end

    it 'redirect to add food new food in food list page' do
      click_link('You can add new food in food store here', exact: true)
      expect(page).to have_current_path(new_food_path)
    end

    it 'should add new food in Inventory' do
      click_button('Add Food To Inventory', exact: true)
      expect(page).to have_text('Inventory food was successfully created')
    end
  end
end
