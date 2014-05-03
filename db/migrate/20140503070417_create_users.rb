class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :credits
      t.references :printers, index: true

      t.timestamps
    end
  end
end
