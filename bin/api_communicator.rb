require_relative '../config/environment'


@news_api = News.new("a9bec172fc834808922ae745dff0d340")

# Get Tech Crunch Headlines
def headlines
  @news_api.get_top_headlines(sources: "TechCrunch")
end

#Request Calls
def get_javascript_articles
  url = 'https://newsapi.org/v2/everything?'\
      'q=Javascript&'\
      'from=2018-10-02&'\
      'sortBy=popularity&'\
      'apiKey=a9bec172fc834808922ae745dff0d340'

      req = open(url)
      response_body = req.read
      return response_body
end

def get_html_articles
  url = 'https://newsapi.org/v2/everything?'\
      'q=HTML%20CSS&'\
      'from=2018-10-02&'\
      'sortBy=popularity&'\
      'apiKey=a9bec172fc834808922ae745dff0d340'

      req = open(url)
      response_body = req.read
      return response_body
end

def get_ruby_articles
  url = 'https://newsapi.org/v2/everything?'\
      'q=Ruby%20on%20Rails&'\
      'from=2018-10-02&'\
      'sortBy=popularity&'\
      'apiKey=a9bec172fc834808922ae745dff0d340'

      req = open(url)
      response_body = req.read
      return response_body
end

def get_sql_articles
  url = 'https://newsapi.org/v2/everything?'\
      'q=SQL&'\
      'from=2018-10-02&'\
      'sortBy=popularity&'\
      'apiKey=a9bec172fc834808922ae745dff0d340'

      req = open(url)
      response_body = req.read
      return response_body
end

<<<<<<< HEAD:app/controllers/api_communicator.rb

  def theheadlines
    headlines.collect do |article|
      article.title
    end
  end


  def get_html_articles
    url = 'https://newsapi.org/v2/everything?'\
        'q=HTML%20CSS&'\
        'from=2018-10-02&'\
        'sortBy=popularity&'\
        'apiKey=a9bec172fc834808922ae745dff0d340'

        req = open(url)
        response_body = req.read
        return response_body
  end
=======
google = headlines
binding.pry
0
>>>>>>> Master:bin/api_communicator.rb
