class RenameReview < ActiveRecord::Migration[7.0]
  def change
    rename_table :reviews, :ratings
    rename_column :ratings, :comment, :review
    remove_reference :ratings, :local
    add_reference :ratings, :location
  end
end
