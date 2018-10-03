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
      puts "Welcome #{user.first_name}\n"

      loop do
        puts "Please select from the following:\n- Saved Articles \n- Topics\n\n"
        response = gets.chomp
        response = response.downcase
        saved_articles(user) if "saved articles" == response
        topics if response == "topics"
        break if response == 'exit'
      end
    end
  end
end

### Methods

def welcome
  puts "\nWelcome to our News App\n\nPlease tell us your first and last name:"
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

def store_or_get_name(response)
  response = response.split
  user = User.find_by(first_name: response[0], last_name: response[1])
  user ? (return user) : (User.create(first_name: response[0], last_name: response[1]))
end


def saved_articles(user)
  puts "Here are your saved articles:\n"

# Getting articles
  articles = user.articles
  return puts "You have no saved articles" if !articles.count
  articles = user.articles

# Displaying articles
  articles.each_with_index do |article, i|
    puts "#{i + 1}. #{article.name}"
  end


# Options going forward
  loop do
    puts "Please select article by number, or back"
    response = gets.chomp
    return if response.downcase == 'back'
    if response.to_i > 0 && response.to_i <= articles.count
      puts "You have selected an article, need selected article method"
      break
    else
      puts "Your input was invalid"
    end
  end

end

def topics
  puts 'Please select one of the topics:'
# Displays all topics
  Topic.all.each_with_index do |topic, i|
    puts "#{i + 1}. #{topic.name}"
  end
  response = gets.chomp

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

  response = gets.chomp
# open
# binding.pry
  Launchy.open(articles[response.to_i + 1].url)
end

run
