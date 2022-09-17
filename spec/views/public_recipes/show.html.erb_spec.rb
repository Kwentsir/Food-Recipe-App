require 'rails_helper'

RSpec.describe "public_recipes/show", type: :view do
  before(:each) do
    @public_recipe = assign(:public_recipe, PublicRecipe.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
