class Place < ApplicationRecord
  has_many :place_categories, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favourite_places, dependent: :destroy
  has_many :trip_places, dependent: :destroy
end
