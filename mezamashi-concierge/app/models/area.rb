class Area < ActiveRecord::Base
  has_many :areas_railroad_companies
  has_many :prefectures
  has_many :railroad_companies, through: :areas_railroad_companies
end
