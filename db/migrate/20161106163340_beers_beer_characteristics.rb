class BeersBeerCharacteristics < ActiveRecord::Migration[5.0]
  def change
    create_table :beers_beer_characteristics, id: false do |t|
      t.belongs_to :beer, index: true, null: false
      t.belongs_to :beer_characteristics, index: true, null: false
    end
  end
end
