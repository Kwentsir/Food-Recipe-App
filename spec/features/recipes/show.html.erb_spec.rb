require 'rails_helper'

RSpec.describe 'recipes/show', type: :feature do
  before do
    @user = User.create(name: 'Username', email: 'example@email.com', password: 'password')
    @user.save
    login_as(@user)
    @recipe = Recipe.create(name: 'Recipe 1', preparation_time: '10', cooking_time: '10', public: true,
                            description: 'Recipe description', user: @user)
    @food = Food.create(name: 'Food 1', measurment_unit: 'gram', price: 10)
    @recipe.save
    @food.save
    @recipe_food = RecipeFood.create(recipe: @recipe, food: @food, quantity: 10)
    visit recipe_path(@recipe)
  end

  describe 'visit recipes show page' do
    it 'should have recipe name' do
      expect(page).to have_text('Recipe 1')
    end

    it 'should have recipe preparation time' do
      expect(page).to have_text('10')
    end

    it 'should have recipe cooking time' do
      expect(page).to have_text('10')
    end

    it 'should have recipe food name' do
      expect(page).to have_text('Food 1')
    end

    it 'should have recipe food quantity' do
      expect(page).to have_text('10')
    end

    it 'should have recipe food measurment unit' do
      expect(page).to have_text('gram')
    end

    it 'should have recipe food price' do
      expect(page).to have_text('10')
    end
  end
end
