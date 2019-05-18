# frozen_string_literal: true

FactoryBot.define do
  factory :city, class: City do
    association :pref
    sequence(:name) { |n| "市区町村_#{n}" }
  end
end
