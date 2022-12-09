class CreateFuels < ActiveRecord::Migration[6.0]
  def change
    create_table :fuels do |t|
      t.string :name
      t.string :category
      t.integer :tanks_count

      t.timestamps
    end
  end
end
