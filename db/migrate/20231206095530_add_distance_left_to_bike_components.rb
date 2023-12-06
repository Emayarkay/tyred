class AddDistanceLeftToBikeComponents < ActiveRecord::Migration[7.1]
  def change
    add_column :bike_components, :distance_left, :float
  end
end
