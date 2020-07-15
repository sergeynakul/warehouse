class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.decimal :supply_price, precision: 8, scale: 2, null: false
      t.decimal :shipment_price, precision: 8, scale: 2, null: false

      t.timestamps
    end
  end
end
