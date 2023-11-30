class Bike < ApplicationRecord
  belongs_to :user
  has_many :bike_components, dependent: :destroy
  has_many :components, through: :bike_components

  has_one_attached :photo
end
