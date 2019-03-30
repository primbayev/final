class AddActiveToPlace < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :active, :boolean, default: false
  end
end
