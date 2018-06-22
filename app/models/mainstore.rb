class Mainstore < ApplicationRecord
  has_many :stores
  mount_uploader :image, ImageUploader
end
