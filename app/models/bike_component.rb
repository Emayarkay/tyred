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

  def days_left
    (component.time_until_check * 7) - (Date.today - date_added).to_f
  end

  def weeks_left
    component.time_until_check - ((Date.today - date_added) / 7).to_i
  end

  def distance_left
    # unfinished
    component.distance_until_check
  end

  def time_progress_percentage
    time_progress_percentage = (days_left / (component.time_until_check * 7)) * 100

    time_progress_percentage <= 0 ? 0 : time_progress_percentage
  end

  def time_until_check
    component.time_until_check
  end
end
