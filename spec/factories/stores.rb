# frozen_string_literal: true

FactoryBot.define do
  factory :store, class: Store do
    sequence(:id, &:to_s)
    sequence(:name) { |n| "name_#{n}" }
    sequence(:prefecture) { |n| "prefecture#{n}" }
    sequence(:city) { |n| "city#{n}" }
    sequence(:other_address) { |n| "other_address_#{n}" }
    sequence(:access) { |n| "access_#{n}" }
    sequence(:tel) { |n| "tel_#{n}" }
    sequence(:business_hour) { |n| "business_hour_#{n}" }
    sequence(:chair, &:to_s)
    sequence(:hp) { |n| "hp_#{n}" }
    wifi { true }
    socket { true }
    smoking { true }
    iccard { true }
    mainstore_id { 1 }
  end
end
