require_relative '../config/environment'
require 'pry'

def run
  loop do
### Beginning of our program
      response = welcome
      case response
      when 'exit'
        puts "Goodbye"
        break
      else
### Now I want to check if it's a valid name and store
      user = valid_name?(response)
### After the user has been retrieved or created, now give the users some options
      puts "Welcome #{user.first_name},\n"

      loop do
        puts "Please select from the following:\n1. Saved Articles \n2. Topics\n3. Exit\n\n"
        response = gets.chomp
        response = response.downcase
        saved_articles(user) if "saved articles" == response || "1" == response
        topics(user) if response == "topics" || "2" == response
        break if response == 'exit' || "3" == response
      end
    end
  end
end

### Methods

def welcome
  puts "\nWelcome to the Tech News App\n\nPlease tell us your first and last name:"
  gets.chomp
end

def valid_name?(response)
# This method will take a response loop until the user gives a first and last name.
# Once the user gives a valid, name it will return that user
  user = nil
  loop do
    if response.split.count == 2
      user = store_or_get_name(response)
      break
    else
      puts "Please enter a valid name:"
      response = gets.chomp
    end
  end
 user
end



def saved_articles(user)

# Getting article
  user_articles = user.articles
# Returns that there are no articles
  return puts "You have no saved articles\n\n" if user_articles.empty?
  puts "Here are your saved articles:\n"

# Displaying articles
  user_articles.each_with_index do |article, i|
    puts "#{i + 1}. #{article.title}"
  end

# Options going forward
  loop do
    puts "Please select article by number, delete #, or back"
    response = gets.chomp
    return if response.downcase == 'back'
    if response.to_i > 0 && response.to_i <= user_articles.count
      open_article(user_articles[response.to_i - 1].id)
      break
    elsif response.downcase.split[0] == "delete" && response.downcase.split[1].to_i != 0
      delete_guardado(user_articles[response.downcase.split[1].to_i - 1].id, user.id)
    else
      puts "Your input was invalid"
    end
  end
end

def topics(user)
# Displays all topics
  Topic.all.each_with_index do |topic, i|
    puts "#{i + 1}. #{topic.name}"
  end
  response = gets.chomp
  puts "\n"

# Gets and displays specific topic
  articles = []
  if response.to_i > 0 && response.to_i <= Topic.all.count
    articles = Topic.find(response).articles
    Topic.find(response).articles.each_with_index do |article, i|
      puts "#{i + 1}. #{article.title}"
    end
  else
    puts "Input invalid"
  end

#This will give options to open, back, or save
  loop do
    puts "Please select article by number, save #, or back"
    response = gets.chomp
    return if response.downcase == 'back'
    if response.to_i > 0 && response.to_i <= articles.count
      open_article(articles[response.to_i - 1].id)
      break
    elsif response.downcase.split[0] == "save" && response.downcase.split[1].to_i != 0
      save_article(articles[response.downcase.split[1].to_i - 1].id, user.id)
    else
      puts "Your input was invalid"
    end
  end
end



#### Methods methods also probably called the module


def open_article(article_id)
  Launchy.open(Article.find(article_id).url)
end

def save_article(article, user)
  Guardado.create(user_id: user, article_id: article)
end

def delete_guardado(article, user)
  Guardado.find_by(user_id: user, article_id: article).destroy
end

def store_or_get_name(response)
  response = response.split
  user = User.find_by(first_name: response[0].capitalize, last_name: response[1].capitalize)
  user ? (return user) : (User.create(first_name: response[0].capitalize, last_name: response[1].capitalize))
end
# binding.pry
run
