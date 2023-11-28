class CreateChecks < ActiveRecord::Migration[7.1]
  def change
    create_table :checks do |t|
      t.date :check_date
      t.float :distance_threshold
      t.boolean :passed, default: false

      t.timestamps
    end
  end
end
