class CreatePackages < ActiveRecord::Migration[5.0]
  def change
    create_table :packages do |t|
      t.string :name, index: true, unique: true, null: false

      t.timestamps
    end
  end
end
