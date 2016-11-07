class ClientsRestrictions < ActiveRecord::Migration[5.0]
  def change
    create_table :clients_restrictions, id: false do |t|
      t.belongs_to :client, index: true, null: false
      t.belongs_to :restriction, index: true, null: false
    end
  end
end
