require 'rails_helper'

RSpec.describe 'recipe_foods/new', type: :feature do
  before do
    @user = User.create(name: 'Username', email: 'example@email.com', password: 'password')
    @user.save
    login_as(@user)
    @recipe = Recipe.create(name: 'Recipe 1', preparation_time: '10', cooking_time: '10', public: true,
                            description: 'Recipe description', user: @user)
    @food = Food.create(name: 'Food 1', measurment_unit: 'gram', price: 10)
    @recipe.save
    @food.save
    visit new_recipe_recipe_food_path(@recipe)
    fill_in 'Quantity', with: 10
  end

  describe 'visit new recipe food page' do
    it 'should have header' do
      expect(page).to have_text('New recipe food')
    end

    it 'should have quantity label' do
      expect(page).to have_text('Quantity')
    end

    it 'should have food name label' do
      expect(page).to have_text('Food 1')
    end
  end
end
