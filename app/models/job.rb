class Job < ActiveRecord::Base
	belongs_to :configuration
	belongs_to :printer
end
