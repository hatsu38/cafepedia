FactoryBot.define do
  factory :leak do
    sequence(:name) { |n| "name_#{n}" }
    sequence(:address) { |n| "address_#{n}" }
    sequence(:url) { |n| "url_#{n}" }
    wifi { true }
    socket { true }
    smoking { true }
  end
end
