class RenameNeighborhoodToNeighborhoods < ActiveRecord::Migration[6.0]
  def change
    rename_table :neighborhood, :neighborhoods
  end
end
