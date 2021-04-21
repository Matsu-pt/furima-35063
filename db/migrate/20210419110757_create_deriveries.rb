class CreateDeriveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deriveries do |t|
      t.string :postal_code, null: false
      t.integer :shipping_area_id, null: false
      t.string :municipality, null: false
      t.string :address, null: false
      t.string :build, null: false
      t.string :phone_number, null: false
      t.references :purchase, null: false

      t.timestamps
    end
  end
end
