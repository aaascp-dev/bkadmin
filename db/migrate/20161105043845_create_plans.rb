class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.string :name, index: true, unique: true, null: false
      t.decimal :price, precision: 16, scale: 2, null: false

      t.timestamps
    end
  end
end
