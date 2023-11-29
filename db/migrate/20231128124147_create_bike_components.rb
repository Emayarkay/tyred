class CreateBikeComponents < ActiveRecord::Migration[7.1]
  def change
    create_table :bike_components do |t|
      t.references :bike, null: false, foreign_key: true
      t.references :component, null: false, foreign_key: true
      t.date :date_added
      t.float :distance_travelled
      t.datetime :custom_time_check_interval

      t.timestamps
    end
  end
end
