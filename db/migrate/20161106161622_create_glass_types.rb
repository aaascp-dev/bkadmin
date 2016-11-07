class CreateGlassTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :glass_types do |t|
      t.name, index: true, unique: true, null: false

      t.timestamps
    end
  end
end
