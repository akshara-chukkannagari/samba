
FactoryGirl.define do
  factory :accomodation, :class => Refinery::Accomodations::Accomodation do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

