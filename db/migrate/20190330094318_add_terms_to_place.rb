class AddTermsToPlace < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :terms, :boolean
  end
end
