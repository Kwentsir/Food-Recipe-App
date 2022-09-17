require 'rails_helper'

RSpec.describe 'recipes/new', type: :feature do
  before do
    @user = User.create(name: 'Username', email: 'example@email.com', password: 'password')
    @user.save
    login_as(@user)
    visit new_recipe_path
    fill_in 'Name', with: 'Recipe 2'
    fill_in 'Preparation time', with: '10'
    fill_in 'Cooking time', with: '10'
    fill_in 'Description', with: 'Recipe description'
    page.check('Public')
  end

  describe 'visit recipes new page' do
    it 'should have name label' do
      expect(page).to have_text('Name')
    end

    it 'should have preparation time label' do
      expect(page).to have_text('Preparation time')
    end

    it 'should have cooking time label' do
      expect(page).to have_text('Cooking time')
    end

    it 'should have description label' do
      expect(page).to have_text('Description')
    end

    it 'should have public label' do
      expect(page).to have_text('Public')
    end

    it 'should have create button' do
      expect(page).to have_selector(:link_or_button, 'Create', exact: true)
    end

    it 'should have index page link' do
      expect(page).to have_selector(:link_or_button, 'Back to recipes', exact: true)
    end

    it 'redirect to recipe index page' do
      click_link('Back to recipes', exact: true)
      expect(page).to have_current_path(recipes_path)
    end

    it 'redirect to index with success message' do
      click_button('Create', exact: true)
      expect(page).to have_current_path(recipes_path)
      expect(page).to have_text('Recipe was successfully created')
    end
  end
end
