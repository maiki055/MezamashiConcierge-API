class PrefectureService
  SITE_PATH = 'http://www.gsi.go.jp/KOKUJYOHO/center.htm'

  def initialize
    @scraping = Scraping.new
    @scraping.load_page(SITE_PATH)
  end

  def exec
    @scraping.page.search('.base_txt table a').each do |link|
      prefecture = Prefecture.where(name: link.inner_text).first_or_create
    end
  end
end