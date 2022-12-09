class Fixstatustype < ActiveRecord::Migration[6.0]
  def change
    remove_column :facilities, :status
    add_column :facilities, :status, :string
  end
end
