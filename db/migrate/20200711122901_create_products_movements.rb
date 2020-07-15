class CreateProductsMovements < ActiveRecord::Migration[6.0]
  def change
    create_table :products_movements do |t|
      t.references :product, foreign_key: true
      t.integer :quantity, null: false
      t.references :location, foreign_key: true
      t.date :created_at, index: true, null: false
    end
  end
end
