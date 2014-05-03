class User < ActiveRecord::Base
  has_many :printers
  belongs_to :job
end
