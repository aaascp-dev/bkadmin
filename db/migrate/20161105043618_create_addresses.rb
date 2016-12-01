class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :zip_code, index: true, null: false
      t.belongs_to :client, index: true, null: false
      t.string :street
      t.integer :number
      t.string :complement
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
