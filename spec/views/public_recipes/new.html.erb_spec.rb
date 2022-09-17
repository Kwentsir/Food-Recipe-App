require 'rails_helper'

RSpec.describe 'public_recipes/new', type: :view do
  before(:each) do
    assign(:public_recipe, PublicRecipe.new)
  end

  it 'renders new public_recipe form' do
    render

    assert_select 'form[action=?][method=?]', public_recipes_path, 'post' do
    end
  end
end
