class CreateGlasses < ActiveRecord::Migration[5.0]
  def change
    create_table :glasses do |t|
      t.belongs_to :glass_type
      t.belongs_to :provider, index: true
      t.string :name, index: true, null: false
      t.integer :stock
      t.decimal :price, precision: 16, scale: 2
      t.decimal :cost, precision: 16, scale: 2
      t.integer :volume

      t.timestamps
    end
  end
end
