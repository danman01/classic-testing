# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pet do
    name "Rover"
    date_of_birth "2012-08-19"
    association :owner
  end
end
