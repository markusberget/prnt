class User < ActiveRecord::Base
  belongs_to :printers
  belongs_to :job
end
