class ChangePoiIdToIntegerInPlaces < ActiveRecord::Migration[7.0]
  def up
    change_column :places, :poi_id, :integer, using: 'poi_id::integer'
  end

  def down
    change_column :places, :poi_id, :string, using: 'poi_id::string'
  end
end
