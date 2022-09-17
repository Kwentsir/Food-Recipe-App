require 'rails_helper'

RSpec.describe "public_recipes/index", type: :view do
  before(:each) do
    assign(:public_recipes, [
      PublicRecipe.create!(),
      PublicRecipe.create!()
    ])
  end

  it "renders a list of public_recipes" do
    render
  end
end
