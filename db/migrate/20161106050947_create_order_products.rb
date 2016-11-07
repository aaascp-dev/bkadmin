class CreateOrdersProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :orders_products do |t|
      t.belongs_to :order, index: true, null: false
      t.belongs_to :product, index: true, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
