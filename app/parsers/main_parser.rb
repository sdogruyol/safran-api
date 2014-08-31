class MainParser < BaseParser

  def initialize
    @url = 'http://www.safran.io/basliklar'
    @base_url = 'http://www.aksam.com.tr/yazarlar/'
    @selector = 'div.large-12.columns ul.stories.faux-table li'
  end

  def parse
    AGENT.get @url
    stories = AGENT.page.parser.css(@selector)
    stories.each do |story|
      title = story.css('h3.story-title a').text
      p title
    end
  end

end