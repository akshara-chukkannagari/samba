
FactoryGirl.define do
  factory :place, :class => Refinery::Snippets::Place do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

