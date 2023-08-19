class AddNeighborhoodIdToLocations < ActiveRecord::Migration[7.0]
  def change
    add_reference :locations, :neighborhood, null: false, foreign_key: true
  end
end
