class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, dependent: :destroy
  has_many :favourite_places, dependent: :destroy
  has_many :favourite_trips, dependent: :destroy
  has_many :user_trips, dependent: :destroy
  has_many :user_places, dependent: :destroy
  has_many :places, through: :user_places
end
