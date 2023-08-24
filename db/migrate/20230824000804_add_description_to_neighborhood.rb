class AddDescriptionToNeighborhood < ActiveRecord::Migration[7.0]
  def change
    add_column :neighborhoods , :description, :string
  end
end
