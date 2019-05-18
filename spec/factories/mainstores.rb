# frozen_string_literal: true

FactoryBot.define do
  factory :mainstore do
    sequence(:name) { |n| "MainName_#{n}" }
    sequence(:image) { "image" }
  end
end
