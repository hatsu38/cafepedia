# frozen_string_literal: true

class Mainstore < ApplicationRecord
  has_many :stores, dependent: :destroy
  mount_uploader :image, ImageUploader
end
