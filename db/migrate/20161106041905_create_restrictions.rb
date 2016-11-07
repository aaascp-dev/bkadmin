class CreateRestrictions < ActiveRecord::Migration[5.0]
  def change
    create_table :restrictions do |t|
      t.belongs_to :beer_restriction, polymorphic: true, null: false

      t.timestamps
    end
    add_index :restrictions, [:beer_restriction_id, :beer_restriction_type]
  end
end
