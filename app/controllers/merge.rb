require 'news-api'
require 'json'
require 'pry'
require 'open-uri'


require_relative './api_communicator'
require_relative './news'
require_relative '../config/environment.rb'


class Merge

def sqlheadlines
    sql_articles = JSON.parse(get_sql_articles)

    sql_articles["articles"].each do |article|
      Article.create(title: article["title"], url: article["url"], topic_id: 4)

end

end




end
