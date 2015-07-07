class Scraping
  def initialize
    @agent = Mechanize.new
  end

  def reload
    @agent.page
  end

  def load_page(url)
    @agent.get(url)
    @agent.page
  end

  def page
    @agent.page
  end
end