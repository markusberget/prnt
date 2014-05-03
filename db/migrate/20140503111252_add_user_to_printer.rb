class AddUserToPrinter < ActiveRecord::Migration
  def change
    add_reference :printers, :user, index: true
  end
end
