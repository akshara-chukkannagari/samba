
FactoryGirl.define do
  factory :price, :class => Refinery::Accomodations::Price do
    sequence(:distribution) { |n| "refinery#{n}" }
  end
end

