class CreateFacilities < ActiveRecord::Migration[6.0]
  def change
    create_table :facilities do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :term_type
      t.string :term_id
      t.string :status
      t.string :county
      t.integer :countyfips
      t.float :latitude
      t.float :longitude
      t.string :source
      t.string :website
      t.string :owner
      t.string :operator
      t.string :commodity
      t.integer :capacity
      t.string :truck_in
      t.string :truck_out
      t.string :pipe_in
      t.string :pipe_out
      t.string :marine_in
      t.string :marine_out
      t.string :rail_in
      t.string :rail_out
      t.string :parsel
      t.string :city
      t.string :state
      t.string :zip
      t.string :zip4
      t.integer :naics_code
      t.string :naics_desc
      t.string :exstars_i
      t.boolean :asphalt
      t.boolean :chemicals
      t.boolean :propane
      t.boolean :butane
      t.boolean :refined
      t.boolean :ethanol
      t.boolean :biodiesel
      t.boolean :crude_oil
      t.boolean :jetfuel
      t.boolean :gasoline
      t.boolean :distillate
      t.boolean :avgas
      t.boolean :renewable_diesel

      t.timestamps
    end
  end
end
