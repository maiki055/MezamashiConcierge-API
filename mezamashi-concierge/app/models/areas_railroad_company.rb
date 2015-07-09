class AreasRailroadCompany < ActiveRecord::Base
  belongs_to :area
  belongs_to :railroad_company
end
