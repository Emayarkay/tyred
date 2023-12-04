class RemoveStravaConnectedFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :strava_connected, :boolean
  end
end
