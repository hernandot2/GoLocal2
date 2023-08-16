class RenameLocals < ActiveRecord::Migration[7.0]
  def change
    rename_table :locals, :location
  end
end
