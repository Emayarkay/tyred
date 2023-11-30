class RemoveStravaIdFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :strava_id, :integer
  end
end
