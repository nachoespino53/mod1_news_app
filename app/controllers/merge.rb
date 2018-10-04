require 'json'
# require 'pry'
#
#
# require_relative './api_communicator'
# require_relative './news'
# # require_relative '../config/environment.rb'


class Merge

  def self.sql_headlines
    sql_articles = JSON.parse(get_sql_articles)

    sql_articles["articles"].each do |article|
      Article.create(title: article["title"], url: article["url"], topic_id: 4)
    end
  end

  def self.javascript_headlines
    js_articles = JSON.parse(get_javascript_articles)

    js_articles["articles"].each do |article|
      Article.create(title: article["title"], url: article["url"], topic_id: 2)
  end
end

  def self.headlines
    headlines.collect do |article|
      article.title
    end
  end



end
