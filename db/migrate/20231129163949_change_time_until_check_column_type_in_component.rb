class ChangeTimeUntilCheckColumnTypeInComponent < ActiveRecord::Migration[7.1]
  def change
    remove_column :components, :time_until_check, :datetime
    add_column :components, :time_until_check, :integer
  end
end
