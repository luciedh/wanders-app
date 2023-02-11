class AddCategoryToTrips < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :category, :string
  end
end
