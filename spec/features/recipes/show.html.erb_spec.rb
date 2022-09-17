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

    it 'should have recipe description' do
      expect(page).to have_text('Recipe description')
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

    it 'should have recipe food total price' do
      expect(page).to have_text('100')
    end

    it 'should have recipe total price' do
      expect(page).to have_text('110')
    end

    it 'should have delete button' do
      expect(page).to have_selector(:link_or_button, 'Delete', exact: true)
    end

    it 'should have a link to add new food' do
      expect(page).to have_selector(:link_or_button, 'Add new food', exact: true)
    end

    it 'should have a link to edit recipe' do
      expect(page).to have_selector(:link_or_button, 'Edit', exact: true)
    end
  end
end
