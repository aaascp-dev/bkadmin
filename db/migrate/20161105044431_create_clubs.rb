class CreateClubs < ActiveRecord::Migration[5.0]
  def change
    create_table :clubs do |t|
        t.belongs_to :plan, index: true, null: false
        t.date :date, null: false

      t.timestamps
    end
    add_index :clubs, [:plan, :date], unique: true
  end
end
