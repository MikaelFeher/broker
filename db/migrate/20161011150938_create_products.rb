class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.integer :price
      t.string :address
      t.string :city
      t.integer :rooms
      t.integer :living_space
      t.integer :property_size
      t.text :description
      t.integer :build_year
      t.string :ownership_form
      t.integer :upkeep

      t.timestamps
    end
  end
end
