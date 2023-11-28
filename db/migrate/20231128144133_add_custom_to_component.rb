class AddCustomToComponent < ActiveRecord::Migration[7.1]
  def change
    add_column :components, :custom, :boolean, default: false
  end
end
