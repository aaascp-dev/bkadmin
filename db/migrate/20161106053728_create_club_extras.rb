class CreateClubExtras < ActiveRecord::Migration[5.0]
  def change
    create_table :club_extras do |t|
      t.belongs_to :club, index: true, null: false
      t.belongs_to :extra, polymorphic: true, index: true, null: false
      t.belongs_to :client, index: true, null: false
      t.text :comments
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
