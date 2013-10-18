
FactoryGirl.define do
  factory :accomodation_type, :class => Refinery::Accomodations::AccomodationType do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

