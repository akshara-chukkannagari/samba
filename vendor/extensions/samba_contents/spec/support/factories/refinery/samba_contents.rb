
FactoryGirl.define do
  factory :samba_content, :class => Refinery::SambaContents::SambaContent do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

