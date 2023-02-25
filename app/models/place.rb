class Place < ApplicationRecord
  has_many :place_categories, dependent: :destroy
  has_many :categories, through: :place_categories
  has_many :comments, dependent: :destroy
  has_many :favourite_places, dependent: :destroy
  has_many :trip_places, dependent: :destroy
  has_many :trips, through: :trip_places
  has_many :user_places, dependent: :destroy
  has_many :users, through: :user_places

  #has_one_attached :audio
end
