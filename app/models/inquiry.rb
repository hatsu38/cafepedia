# frozen_string_literal: true

class Inquiry < ApplicationRecord
  validates :message, presence: true
end
