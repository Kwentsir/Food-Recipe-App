require 'rails_helper'

RSpec.describe "inventory_foods/index", type: :view do
  before(:each) do
    assign(:inventory_foods, [
      InventoryFood.create!(
        quantity: 2
      ),
      InventoryFood.create!(
        quantity: 2
      )
    ])
  end

  it "renders a list of inventory_foods" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
