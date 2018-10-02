require 'news-api'
require 'json'
require 'pry'
require 'open-uri'


@news_api = News.new("a9bec172fc834808922ae745dff0d340")

# Tech Crunch Headlines
def headlines
  @news_api.get_top_headlines(sources: "TechCrunch")
end

#Request Call
url = 'https://newsapi.org/v2/everything?'\
      'q=Javascript&'\
      'from=2018-10-02&'\
      'sortBy=popularity&'\
      'apiKey=a9bec172fc834808922ae745dff0d340'

req = open(url)
response_body = req.read
puts response_body

binding.pry
0
