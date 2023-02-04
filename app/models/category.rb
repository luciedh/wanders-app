class Category < ApplicationRecord
  has_many :place_categories, dependent: :destroy
  has_many :places, through: :place_categories
end
