class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :document
      t.integer :copies
      t.references :configuration, index: true
      t.references :user, index: true

      t.string :status

      t.timestamps
    end
  end
end
