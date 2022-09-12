require 'rails_helper'

RSpec.describe 'foods/edit', type: :view do
  before(:each) do
    @food = assign(:food, Food.create!(
                            name: 'MyString',
                            measurment_unit: 1,
                            price: 1
                          ))
  end

  it 'renders the edit food form' do
    render

    assert_select 'form[action=?][method=?]', food_path(@food), 'post' do
      assert_select 'input[name=?]', 'food[name]'

      assert_select 'input[name=?]', 'food[measurment_unit]'

      assert_select 'input[name=?]', 'food[price]'
    end
  end
end
