class CreateBeers < ActiveRecord::Migration[5.0]
  def change
    create_table :beers do |t|
      t.integer :code, index: true, unique: true
      t.belongs_to :beer_type, null: false
      t.boolean :is_imported, default: false
      t.boolean :is_better_quality, default: false

      t.timestamps
    end
  end
end
