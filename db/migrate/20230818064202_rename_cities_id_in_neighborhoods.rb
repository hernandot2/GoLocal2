class RenameCitiesIdInNeighborhoods < ActiveRecord::Migration[6.0]
  def change
    rename_column :neighborhoods, :cities_id, :city_id
  end
end
