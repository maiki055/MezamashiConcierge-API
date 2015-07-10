class Prefecture < ActiveRecord::Base
  belongs_to :area
  has_many :cities
end
