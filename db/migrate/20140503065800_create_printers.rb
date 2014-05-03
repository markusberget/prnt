class CreatePrinters < ActiveRecord::Migration
  def change
    create_table :printers do |t|
      t.string :name
      t.string :location
      t.integer :rating
      t.references :configuration, index: true

      t.timestamps
    end
  end
end
