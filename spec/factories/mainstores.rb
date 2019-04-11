FactoryBot.define do
  factory :mainstore, class: Mainstore do
    sequence(:id) { |n| "#{n}" }
    sequence(:name) { |n| "MainName_#{n}" }

    after(:create) do |mainstore|
      create_list(:store, 3, mainstore: mainstore)
    end
  end
end
