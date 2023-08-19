class RenameLocationToLocations < ActiveRecord::Migration[6.0]
  def change
    rename_table :location, :locations
  end
end
