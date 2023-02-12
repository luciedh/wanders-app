class AddPoiIdToPlaces < ActiveRecord::Migration[7.0]
  def change
    add_column :places, :poi_id, :string
  end
end
