class RailroadCompany < ActiveRecord::Base
  has_many :areas_railroad_companies
  has_many :railroads
end
