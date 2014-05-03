class Printer < ActiveRecord::Base
  belongs_to :configuration
  has_one :user
end
