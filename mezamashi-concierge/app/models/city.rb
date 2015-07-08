class City < ActiveRecord::Base
  belongs_to :prefecture
  has_one :weather
end
