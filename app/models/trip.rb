class Trip < ApplicationRecord
  has_many :favourite_trips, dependent: :destroy
  has_many :trip_places, dependent: :destroy
  has_many :user_trips, dependent: :destroy
end
