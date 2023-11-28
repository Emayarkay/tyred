class Component < ApplicationRecord
  belongs_to :bike_component
  has_many :bikes, through: :bike_components
  validates :name, :time_until_check, :distance_until_check, presence: true
end
