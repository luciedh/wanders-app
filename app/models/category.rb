class Category < ApplicationRecord
  has_many :place_categories, dependent: :destroy
end
