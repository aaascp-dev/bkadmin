class CreateRestrictions < ActiveRecord::Migration[5.0]
  def change
    create_table :restrictions do |t|
      t.belongs_to :beer_restriction, polymorphic: true, null: false,
                    index: { :name => "index_beer_restriction" }

      t.timestamps
    end
  end
end
