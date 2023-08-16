class AddLocationIdToEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :address
    add_reference :events, :location
    add_reference :events, :neighborhood
  end
end
