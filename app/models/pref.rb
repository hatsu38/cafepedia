# frozen_string_literal: true

class Pref < ApplicationRecord
  has_many :cities, dependent: :destroy
end
