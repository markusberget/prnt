class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table :configurations do |t|
      t.integer :price
      t.boolean :color
      t.string :size
      t.boolean :double_sided
      t.text :description

      t.timestamps
    end
  end
end
