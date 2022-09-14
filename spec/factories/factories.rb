FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    email { 'user@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
  factory :food do
    Name { 'Pizza' }
    Measurment_unit { 'gram' }
    Price { 100 }
  end
end
