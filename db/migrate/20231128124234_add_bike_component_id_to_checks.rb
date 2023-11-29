class AddBikeComponentIdToChecks < ActiveRecord::Migration[7.1]
  def change
    add_reference :checks, :bike_component, null: false, foreign_key: true
  end
end
