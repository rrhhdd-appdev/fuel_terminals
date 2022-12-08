class FixFacilityLogistics < ActiveRecord::Migration[6.0]
  def change
    remove_column :facilities, :truck_in
    remove_column :facilities, :truck_out
    remove_column :facilities, :marine_in
    remove_column :facilities, :marine_out
    remove_column :facilities, :rail_in
    remove_column :facilities, :rail_out
    remove_column :facilities, :pipe_in
    remove_column :facilities, :pipe_out

    add_column :facilities, :truck_in, :string
    add_column :facilities, :truck_out, :string
    add_column :facilities, :marine_in, :string
    add_column :facilities, :marine_out, :string
    add_column :facilities, :rail_in, :string
    add_column :facilities, :rail_out, :string
    add_column :facilities, :pipe_in, :string
    add_column :facilities, :pipe_out, :string
  end
end
