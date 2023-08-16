class AddCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :name

      t.timestamps
    end


    create_table :neighborhood do |t|
      t.string :name
      t.references :cities, null: false, foreign_key: true

      t.timestamps
    end
  end
end
