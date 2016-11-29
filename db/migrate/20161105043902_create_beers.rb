class CreateBeers < ActiveRecord::Migration[5.0]
  def change
    create_table :beers do |t|
      t.integer :code, index: true, unique: true
      t.belongs_to :beer_type, null: false
      t.boolean :is_imported, default: false
      t.boolean :is_better_quality, default: false
      t.string :batch_number
      t.date :expiration_date
      t.integer :volume

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
