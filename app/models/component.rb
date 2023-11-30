class Component < ApplicationRecord
  has_many :bike_components
  has_many :bikes, through: :bike_components
  validates :name, :time_until_check, :distance_until_check, presence: true

  has_one_attached :icon
  has_one_attached :check_img
end
