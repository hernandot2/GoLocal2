class AddApprovedToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :approved, :boolean
    add_column :locations, :approved, :boolean
  end
end
