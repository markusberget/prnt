class AddDescriptionToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :description, :string
  end
end
