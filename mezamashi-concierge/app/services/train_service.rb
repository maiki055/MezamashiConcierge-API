class TrainService
  SITE_PATH = 'http://transit.yahoo.co.jp/traininfo/top'
  LIST_SELECTOR = '#allinf .area a'


  def initialize
    @scraping = Scraping.new
    @scraping.load_page(SITE_PATH)
  end

  def exec
    @scraping.page.search(LIST_SELECTOR).each do |list|
      area = Area.where(name: list.inner_text).first_or_create
      fetch_lines(list[:href], area)
    end
  end

  def fetch_lines(url, area)
    @scraping.load_page(url)
    @scraping.page.search('#mdAreaMajorLine .labelSmall').each do |label_small|
      railroad_company = RailroadCompany.where(name: label_small.inner_text.strip).first_or_create
      AreasRailroadCompany.where(area_id: area.id, railroad_company_id: railroad_company.id).first_or_create
      label_small.next_element.search('tr a').each do |train_a|
        railroad = Railroad.where(name: train_a.inner_text).first_or_initialize do |r|
          r.railroad_company = railroad_company
        end
        detail = train_a.parent.next_element.next_element.inner_text
        if detail == "事故・遅延情報はありません"
          railroad.state = train_a.parent.next_element.inner_text.gsub(/\[(.+)\]/, '')
          railroad.state_detail = detail
        else
          fetch_railroad_information(train_a[:href], railroad)
        end
        railroad.save
        # puts line.parent.next_element.inner_text unless line.parent.next_element.inner_text == "平常運転"
      end
    end
  end

  def fetch_railroad_information(url, railroad)
    @scraping.load_page(url)
    status_ele = @scraping.page.at('#mdServiceStatus')
    
    railroad.state = status_ele.at('dt').inner_text.strip.gsub(/\[(.+)\]/, '')
    railroad.state_detail = status_ele.at('p').inner_text.strip
  end
end