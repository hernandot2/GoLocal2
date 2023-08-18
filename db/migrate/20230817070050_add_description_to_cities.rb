class AddDescriptionToCities < ActiveRecord::Migration[7.0]
  def change
    add_column :cities, :description, :text
  end
end
