FactoryGirl.define do
  factory :balance_positive, class: Balance do
    user
    sequence(:price)  { |n| n }
    signal            "+"
    color             "#008B00"
  end

  factory :balance_negative, class: Balance do
    user
    sequence(:price)  { |n| n }
    signal            "-"
    color             "#FF0000"
  end

  factory :balance_unsigned, class: Balance do
    user
    sequence(:price)  { |n| n }
    signal            "+"
    color             "#008B00"
  end
end
