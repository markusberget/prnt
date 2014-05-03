class Job < ActiveRecord::Base
	belongs_to :configuration
	belongs_to :printer
	belongs_to :user
end
