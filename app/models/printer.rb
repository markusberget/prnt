class Printer < ActiveRecord::Base
  belongs_to :configuration
  belongs_to :job
  has_one :user
end
