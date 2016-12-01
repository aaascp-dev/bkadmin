class CreateClubExtras < ActiveRecord::Migration[5.0]
  def change
    create_table :club_extras do |t|
      t.belongs_to :club, index: true, null: false
      t.belongs_to :extra, polymorphic: true, null: false
      t.belongs_to :client, index: true, null: false
      t.belongs_to :extra_type
      t.text :comments
      t.integer :quantity, null: false

      t.timestamps
    end
    add_index :club_extras, [:club_id ,:extra_id, :extra_type, :client_id], unique: true, name: "index_club_extra"
  end
end
