class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.belongs_to :client, indext: true, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
