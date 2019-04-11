# frozen_string_literal: true

FactoryBot.define do
  factory :mainstore, class: Mainstore do
    sequence(:id, &:to_s)
    sequence(:name) { |n| "MainName_#{n}" }

    after(:create) do |mainstore|
      create_list(:store, 3, mainstore: mainstore)
    end
  end
end
