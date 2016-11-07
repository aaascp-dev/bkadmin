class CreateGlasses < ActiveRecord::Migration[5.0]
  def change
    create_table :glasses do |t|
      t.belongs_to :glass_type
      t.string :name, index: true, unique: true, null: false

      t.timestamps
    end
  end
end
