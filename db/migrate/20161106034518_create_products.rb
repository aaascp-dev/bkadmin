class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, index: true, null: false
      t.integer :stock
      t.decimal :price, precision: 16, scale: 2
      t.decimal :cost, precision: 16, scale: 2
      t.belongs_to :provider, index: true
      t.belongs_to :package

      t.timestamps
    end
  end
end
