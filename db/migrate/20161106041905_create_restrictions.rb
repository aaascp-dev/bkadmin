class CreateRestrictions < ActiveRecord::Migration[5.0]
  def change
    create_table :restrictions do |t|
      t.belong_to :beer_restriction, polymorphic: true, index: true, null: false

      t.timestamps
    end
  end
end
