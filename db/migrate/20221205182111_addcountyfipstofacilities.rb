class Addcountyfipstofacilities < ActiveRecord::Migration[6.0]
  def change
    add_column :facilities, :countyfips, :integer
  end
end
