class CreateTerminalNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :terminal_notes do |t|
      t.text :note
      t.integer :user_id
      t.integer :terminal_id

      t.timestamps
    end
  end
end
