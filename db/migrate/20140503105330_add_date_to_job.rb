class AddDateToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :date, :date
  end
end
