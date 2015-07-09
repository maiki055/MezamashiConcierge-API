class Railroad < ActiveRecord::Base
  include RailroadStatus
  
  belongs_to :railroad_company
end
