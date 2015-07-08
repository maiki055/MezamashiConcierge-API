class CityService
  def initialize(prefecture, url)
    @prefecture = prefecture
    @scraping = Scraping.new
    @scraping.load_page(url)
  end

  def body
    @scraping.page.body
  end

  def scan_cites
    tmpBody = body.gsub(/TABLE/, "table")
    tmpBody.scan(/<br>(.+)\n<table/)
  end

  def degree_to_f(degree)
    degree.gsub(/°/, ".").gsub(/′|″/, "").to_f
  end

  def exec
    cites = scan_cites()
    @scraping.page.search('table[border^="1"]').each_with_index do |table, i|
      city = City.where(name: cites[i][0].chomp).first_or_initialize
      city.prefecture = @prefecture
      tr_set = table.search('tr')
      long_td = tr_set[1].at('td[align^="right"]')
      lat_td  = tr_set[2].at('td[align^="right"]')
      city.longitude = degree_to_f(long_td.inner_text)
      city.latitude  = degree_to_f(lat_td.inner_text)
      city.save
    end
  end
end