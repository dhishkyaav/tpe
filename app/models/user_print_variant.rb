class UserPrintVariant < ActiveRecord::Base

def size
  "#{self.width}X#{self.height} in #{self.finish}"
end
end
