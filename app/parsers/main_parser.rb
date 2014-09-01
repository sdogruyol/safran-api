class MainParser < BaseParser

  def initialize
    @urls = %w{http://www.safran.io/basliklar http://www.safran.io/basliklar/yeniler}
    @base_url = 'http://www.safran.io'
    @selector = 'div.large-12.columns ul.stories.faux-table li'
  end

  def parse
    @urls.each do |url|
      AGENT.get url
      stories = AGENT.page.parser.css(@selector)
      stories.each do |story|
        title = story.css('h3.story-title a')[0].text
        link = if story.css('h3.story-title a')[1].nil?
                 story.css('h3.story-title a')[0].attr('href')
               else
                 story.css('h3.story-title a')[1].attr('href')
               end
        comment_count = story.css('div.author-line a')[0].text.split(' ')[0].to_i
        comment_link = @base_url + story.css('div.author-line a')[0].attr('href')
        owner_name = story.css('div.author-line a')[1].text
        owner_link = @base_url + story.css('div.author-line a')[1].attr('href')

        # p "Title #{title} Link #{link} Comment Count #{comment_count} Comment Link #{comment_link} OwnerName #{owner_name} Owner Link #{owner_link}"
      end
    end
  end
end