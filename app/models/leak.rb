# frozen_string_literal: true

class Leak < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :url, presence: true
  validates :wifi, presence: true
  validates :socket, presence: true
  validates :smoking, presence: true
end
