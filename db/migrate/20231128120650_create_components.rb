class CreateComponents < ActiveRecord::Migration[7.1]
  def change
    create_table :components do |t|
      t.string :name
      t.datetime :time_until_check
      t.float :distance_until_check
      t.text :check_advice

      t.timestamps
    end
  end
end
