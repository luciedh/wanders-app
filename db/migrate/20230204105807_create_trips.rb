class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.string :departure
      t.string :arrival
      t.float :geo_long_departure
      t.float :geo_lat_departure
      t.float :geo_long_arrival
      t.float :geo_lat_arrival
      t.float :kms
      t.integer :duration

      t.timestamps
    end
  end
end
