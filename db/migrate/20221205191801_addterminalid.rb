class Addterminalid < ActiveRecord::Migration[6.0]
  def change
    add_column :facilities, :terminal_id, :string
  end
end
