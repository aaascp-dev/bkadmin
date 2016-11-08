class CreateClubsProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :clubs_products do |t|
      t.belongs_to :club, index: true, null: false
      t.belongs_to :product, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
    add_index :clubs_products, [:club_id, :product_id], unique: true
  end
end
