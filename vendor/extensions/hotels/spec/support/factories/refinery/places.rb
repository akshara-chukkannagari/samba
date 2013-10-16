
FactoryGirl.define do
  factory :place, :class => Refinery::Hotels::Place do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

