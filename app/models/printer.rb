class Printer < ActiveRecord::Base
  belongs_to :configuration
  belongs_to :user
  has_many :jobs
end
