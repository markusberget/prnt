class AddPrinterToJob < ActiveRecord::Migration
  def change
    add_reference :jobs, :printer, index: true
  end
end
