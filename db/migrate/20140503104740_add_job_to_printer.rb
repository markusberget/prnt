class AddJobToPrinter < ActiveRecord::Migration
  def change
    add_reference :printers, :job, index: true
  end
end
