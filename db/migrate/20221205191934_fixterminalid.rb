class Fixterminalid < ActiveRecord::Migration[6.0]
  def change
    remove_column :facilities, :terminal_id
    add_column :facilities, :term_id, :string
  end
end
