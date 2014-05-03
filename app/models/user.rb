class User < ActiveRecord::Base
  has_many :printers
  has_many :jobs
end
