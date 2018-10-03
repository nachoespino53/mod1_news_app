class Merge

  def self.sql
    sql_articles = JSON.parse(get_sql_articles)

    sql_articles["articles"].each do |article|
      Article.create(title: article["title"], url: article["url"], topic_id: 4)
    end
  end

  def self.javascript
    js_articles = JSON.parse(get_javascript_articles)

    js_articles["articles"].each do |article|
      Article.create(title: article["title"], url: article["url"], topic_id: 2)
    end
  end

  def self.head(articles)
    articles.each do |article|
      Article.create(title: article.title, url: article.url, topic_id: 5)
    end
  end

  def self.ruby
    ruby_articles = JSON.parse(get_ruby_articles)
    ruby_articles["articles"].each do |article|
      Article.create(title: article["title"], url: article["url"], topic_id: 1)
    end
  end

  def self.html
    html_articles = JSON.parse(get_html_articles)
    html_articles["articles"].each do |article|
      Article.create(title: article["title"], url: article["url"], topic_id: 3)
    end
  end
end
