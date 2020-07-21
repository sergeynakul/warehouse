class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :title, null: false
      t.string :address

      t.timestamps
    end
  end
end
