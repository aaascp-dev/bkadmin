class CreateExtraTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :extra_types do |t|
      t.string :name, index: true, unique: true, null: false

      t.timestamps
    end
  end
end
