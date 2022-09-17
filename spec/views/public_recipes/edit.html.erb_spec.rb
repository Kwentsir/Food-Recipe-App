require 'rails_helper'

RSpec.describe 'public_recipes/edit', type: :view do
  before(:each) do
    @public_recipe = assign(:public_recipe, PublicRecipe.create!)
  end

  it 'renders the edit public_recipe form' do
    render

    assert_select 'form[action=?][method=?]', public_recipe_path(@public_recipe), 'post' do
    end
  end
end
