# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :owner do
    first_name "Roger"
    last_name "Dodger"
    email "roger@example.com"
  end
end
