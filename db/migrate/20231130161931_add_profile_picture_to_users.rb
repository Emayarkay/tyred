class AddProfilePictureToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :profile_picture, :string
  end
end
