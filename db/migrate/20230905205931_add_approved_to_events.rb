class AddApprovedToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :approved, :boolean
    add_column :locations, :approved, :boolean
    change_column_default :events, :approved, false
    change_column_default :locations, :approved, false
  end
end
