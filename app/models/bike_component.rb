class BikeComponent < ApplicationRecord
  belongs_to :bike
  belongs_to :component
  has_many :checks, dependent: :destroy

  def total_cumulative_time
    component.time_until_check
  end

  def total_cumulative_distance
    distance_until_check
  end

  def days_left
    (component.time_until_check * 7) - (Date.today - date_added).to_f
  end

  def weeks_left
    component.time_until_check - ((Date.today - date_added) / 7).to_i
  end

  def set_distance_travelled
    if bike.user.strava_connected?
      update(distance_travelled: bike.user.strava_service.calculate_total_distance(since_date: date_added))
    end
  end

  def distance_left
    # unfinished
    # "max distance: #{distance_until_check} MINUS travelled_distance: #{bike.user.strava_service.calculate_total_distance(since_date: date_added )}"
    distance_until_check - distance_travelled
  end

  def distance_progress_percentage
    distance_progress_percentage_result = (distance_left / distance_until_check) * 100

    distance_progress_percentage_result <= 0 ? 0 : distance_progress_percentage_result
  end

  def time_progress_percentage
    time_progress_percentage = (days_left / (component.time_until_check * 7)) * 100

    time_progress_percentage <= 0 ? 0 : time_progress_percentage
  end

  def time_until_check
    component.time_until_check
  end

  def distance_until_check
    if custom_distance_until_check.blank?
      component.distance_until_check
    else
      custom_distance_until_check
    end
  end

  def self.sort_by_weeks_left
    all.sort_by(&:weeks_left)
  end
end
