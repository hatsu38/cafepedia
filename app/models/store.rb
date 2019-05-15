# frozen_string_literal: true

class Store < ApplicationRecord
  belongs_to :mainstore
  belongs_to :pref
end
