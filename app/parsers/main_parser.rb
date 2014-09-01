class MainParser < BaseParser

  def initialize
    @urls = %w{http://www.safran.io/basliklar http://www.safran.io/basliklar/yeniler}
    @types = %w{is_hot is_new}
    @base_url = 'http://www.safran.io'
    @selector = 'div.large-12.columns ul.stories.faux-table li'
    @urls.zip(@types).each do |url, type|
      parse url, type
    end
  end

  def parse(url, type)
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

      Story.create(
          title: title,
          link: link,
          comment_count: comment_count,
          comment_link: comment_link,
          owner_name: owner_name,
          owner_link: owner_link,
          type: Story.types[type]
      )
    end

  end
end