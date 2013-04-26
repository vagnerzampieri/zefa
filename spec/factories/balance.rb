FactoryGirl.define do
  factory :balance_positive, class: Balance do
    user
    sequence(:price)  { |n| n }
    signal            "+"
    color             "#008B00"
  end
end
