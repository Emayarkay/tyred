class AddCustomDistanceUntilCheckToBikeComponents < ActiveRecord::Migration[7.1]
  def change
    add_column :bike_components, :custom_distance_until_check, :float
  end
end
