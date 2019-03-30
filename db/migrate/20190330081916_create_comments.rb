class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :place, foreign_key: true
      t.text :body
      t.integer :food_quality
      t.integer :service_quality
      t.integer :interior

      t.timestamps
    end
  end
end
