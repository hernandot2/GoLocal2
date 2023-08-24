class AddStateToCity < ActiveRecord::Migration[7.0]
  def change
    add_column :cities , :state, :string
  end
end
