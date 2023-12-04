class ChangePhoneToStringOnBikeShops < ActiveRecord::Migration[7.1]
  def change
    change_column :bike_shops, :phone_number, :string
  end
end
