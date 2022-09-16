require 'rails_helper'

RSpec.describe 'recipes/index', type: :feature do
  before do
    @user = User.create(name: 'Username', email: 'example@email.com', password: 'password')
    @user.save
    login_as(@user)
    @recipe = Recipe.create(name: 'Recipe 1', preparation_time: '10', cooking_time: '10', public: true,
                            description: 'Recipe description', user: @user)
    visit recipes_path
  end

  describe "Visit recipes' index page" do
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
  end
end
