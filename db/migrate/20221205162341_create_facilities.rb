class CreateFacilities < ActiveRecord::Migration[6.0]
  def change
    create_table :facilities do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :term_type
      t.boolean :status
      t.string :county
      t.float :latitude
      t.float :longitude
      t.string :source
      t.string :website
      t.string :owner
      t.string :operator
      t.string :commodity
      t.integer :capacity
      t.boolean :truck_in
      t.boolean :truck_out
      t.boolean :pipe_in
      t.boolean :pipe_out
      t.boolean :marine_in
      t.boolean :marin_out
      t.boolean :rail_in
      t.boolean :rail_out
      t.string :parsel
      t.string :city
      t.string :state
      t.string :zip
      t.string :zip4
      t.integer :tanks_count

      t.timestamps
    end
  end
end
