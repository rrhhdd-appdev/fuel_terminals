class Fixmarinetitle < ActiveRecord::Migration[6.0]
  def change
    remove_column :facilities, :marin_out
    add_column :facilities, :marine_out, :boolean
  end
end
