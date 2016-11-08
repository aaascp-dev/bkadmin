class CreateReferrals < ActiveRecord::Migration[5.0]
  def change
    create_table :referrals do |t|
      t.belongs_to :inviter, index: true, null: false
      t.belongs_to :guest, index: true, null: false
      t.date :date, null: false
      t.date :bonus_delivery_date

      t.timestamps
    end
    add_index :referrals, [:inviter_id, :guest_id], unique: true, name: "index_referrals"
  end
end
