class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.belongs_to :address, null: false
      t.string :full_name, index: true, unique: true, null: false
      t.date :birthdate
      t.string :email, index: true, unique: true, null: false
      t.string :phone
      t.integer :document_number, index: true, unique: true, null: false

      t.timestamps
    end
  end
end
