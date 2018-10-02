require 'news-api'
require 'json'
require 'pry'


n = News.new("a9bec172fc834808922ae745dff0d340")

# top headlines
def headlines
  n.get_top_headlines(sources: "tech-crunch")
end
