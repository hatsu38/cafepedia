# frozen_string_literal: true

FactoryBot.define do
  factory :inquiry do
    sequence(:email) { |n| "email_#{n}" }
    sequence(:message) { |n| "message_#{n}" }
  end
end
