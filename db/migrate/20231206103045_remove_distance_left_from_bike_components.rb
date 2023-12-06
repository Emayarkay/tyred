class RemoveDistanceLeftFromBikeComponents < ActiveRecord::Migration[7.1]
  def change
    remove_column :bike_components, :distance_left, :float
  end
end
