class AdaptFavorites < ActiveRecord::Migration[7.0]
  def change
    remove_reference :favorites, :local
    add_reference :favorites, :location
  end
end
