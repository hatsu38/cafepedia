# frozen_string_literal: true

class Pref < ApplicationRecord
  has_many :citys, dependent: :destroy
end
