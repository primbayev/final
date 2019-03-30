class AddAdminAndActiveToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :active, :boolean, default: true
    add_column :users, :admin, :boolean, default: false
  end
end
