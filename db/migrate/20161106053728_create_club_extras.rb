class CreateClubExtras < ActiveRecord::Migration[5.0]
  def change
    create_table :club_extras do |t|
      t.belongs_to :club, index: true, null: false
      t.belongs_to :extra, polymorphic: true, null: false
      t.belongs_to :client, index: true, null: false
      t.text :comments
      t.integer :quantity, null: false

      t.timestamps
    end
    add_index :club_extras, [:extra_id, :extra_type]
  end
end
