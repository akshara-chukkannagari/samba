
FactoryGirl.define do
  factory :address, :class => Refinery::Accomodations::Address do
    sequence(:street) { |n| "refinery#{n}" }
  end
end

