class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.belongs_to :is_product, polymorphic: true, null: false,
                    index: { :name => "index_product" }

      t.timestamps
    end
  end
end
