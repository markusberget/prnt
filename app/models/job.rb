class Job < ActiveRecord::Base
	belongs_to :configuration
	has_many :printers
end
