class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.string :address
      t.float :geo_long
      t.float :geo_lat
      t.text :description
      t.float :average_rating

      t.timestamps
    end
  end
end
