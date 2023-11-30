class BikeComponent < ApplicationRecord
  belongs_to :bike
  belongs_to :component
  has_many :checks, dependent: :destroy

  def total_cumulative_time
    component.time_until_check
  end

  def total_cumulative_distance
    component.distance_until_check
  end

end
