class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
        t.belongs_to :client, index: true, null: false
        t.belongs_to :plan, index: true, null: false
        t.belongs_to :referral_id
        t.date :start_date, null: false
        t.date :end_date
        t.text :cancellation_reason

      t.timestamps
    end
    add_index :subscriptions, [:client_id, :plan_id, :start_date], unique: true,
              name: "index_subscription"
  end
end
