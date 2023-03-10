class CreateFavouritePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :favourite_places do |t|
      t.references :user, null: false, foreign_key: true
      t.references :place, null: false, foreign_key: true

      t.timestamps
    end
  end
end
