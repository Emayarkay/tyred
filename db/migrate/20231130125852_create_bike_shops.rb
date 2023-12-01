class CreateBikeShops < ActiveRecord::Migration[7.1]
  def change
    create_table :bike_shops do |t|
      t.string :name
      t.string :location
      t.integer :rating
      t.string :website
      t.integer :phone_number
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
