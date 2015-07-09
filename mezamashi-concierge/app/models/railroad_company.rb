class RailroadCompany < ActiveRecord::Base
  has_many :areas_railload_companies
  has_many :railroads
end
