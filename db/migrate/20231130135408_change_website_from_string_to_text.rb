class ChangeWebsiteFromStringToText < ActiveRecord::Migration[7.1]
  def change
    change_column :bike_shops, :website, :text
  end
end
