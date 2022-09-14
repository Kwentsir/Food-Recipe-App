require 'spec_helper'
RSpec.describe 'Food', type: :feature do
  it 'should have a form for new food' do
    user = FactoryBot.create(:user)
    user.save
    login_as(user)
    visit new_food_path
    expect(page).to have_content('Name')
  end
  it 'should create a new food' do
    user = FactoryBot.create(:user)
    user.save
    login_as(user)
    visit new_food_path
    fill_in 'Name', with: 'Pizza'
    fill_in 'Measurment unit', with: 'gram'
    fill_in 'Price', with: 100
    click_button 'Create Food'
    expect(current_path).to eq(foods_path)
  end
  it 'displays all food created' do
    user = FactoryBot.create(:user)
    user.save
    login_as(user)
    visit foods_path
    expect(page).to have_content('Food')
  end
  it 'displays a new food button' do
    user = FactoryBot.create(:user)
    user.save
    login_as(user)
    visit foods_path
    expect(page).to have_content('New food')
  end
end
