# frozen_string_literal: true

class Mainstore < ApplicationRecord
  has_many :stores, dependent: :destroy
  validates :name, presence: true

  mount_uploader :image, ImageUploader
end
