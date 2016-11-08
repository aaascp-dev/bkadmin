class ClientsRestrictions < ActiveRecord::Migration[5.0]
  def change
    create_table :clients_restrictions, id: false do |t|
      t.belongs_to :client, index: true, null: false
      t.belongs_to :restriction, null: false
    end
    add_index :clients_restrictions, [:client_id, :restriction_id],
              unique: true, name: "index_clients_restrictions"
  end
end
