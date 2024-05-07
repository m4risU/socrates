FactoryBot.define do
  factory :test_cycle_day do
    test_cycle { nil }
    day_number { 1 }
    mucus { "MyString" }
    temp { 1.5 }
  end
end
