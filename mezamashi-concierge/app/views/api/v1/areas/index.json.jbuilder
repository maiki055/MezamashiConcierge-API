json.areas @areas.each do |area|
  json.(area, :id, :name)
  json.railroad_companies area.railroad_companies.each do |railroad_company|
    json.(railroad_company, :id, :name)
    json.railroads railroad_company.railroads.each do |railroad|
      json.(railroad, :id, :name)
    end
  end
end