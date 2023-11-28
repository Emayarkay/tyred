class Bike < ApplicationRecord
  belongs_to :user
  has_many :bike_components
  has_many :components, through: :bike_components
end
