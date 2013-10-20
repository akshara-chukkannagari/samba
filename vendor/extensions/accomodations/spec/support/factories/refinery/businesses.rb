
FactoryGirl.define do
  factory :business, :class => Refinery::Accomodations::Business do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

