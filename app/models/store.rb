# frozen_string_literal: true

class Store < ApplicationRecord
  belongs_to :mainstore
  belongs_to :pref

  validates :name, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :other_address, presence: true
  validates :access, presence: true
  validates :tel, presence: true
  validates :business_hour, presence: true
  validates :wifi, presence: true
  validates :socket, presence: true
  validates :name, presence: true
  validates :smoking, presence: true
  validates :lat, presence: true
  validates :lng, presence: true
  validates :is_open, presence: true
end
