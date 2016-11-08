class CreateOrdersProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :orders_products do |t|
      t.belongs_to :order, index: true, null: false
      t.belongs_to :product, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
    add_index :orders_products, [:order_id, :product_id], unique: true
  end
end
