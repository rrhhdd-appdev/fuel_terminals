class CreateTanks < ActiveRecord::Migration[6.0]
  def change
    create_table :tanks do |t|
      t.integer :terminal_id
      t.integer :fuel_id
      t.integer :product_capacity

      t.timestamps
    end
  end
end
