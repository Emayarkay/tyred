class AddStravaConnectedToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :strava_connected, :boolean, default: false
  end

end
