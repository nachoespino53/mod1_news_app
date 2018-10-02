require_relative '../config/environment'
require 'pry'

def run

### Beginning of our program
  puts "Welcome to our News App"
  puts "Please tell us your first and last name:"
  response = gets.chomp

### Now I want to check if it's a valid name, or the input is "exit"
  return puts "Goodbye" if response.downcase == 'exit'
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
### After the user has been retrieved or created, now give the users some options
  puts "Welcome #{user.first_name}"
  loop do
    puts "Please select from the following:"
    puts "- Saved Articles \n- Topics"
    response = gets.chomp
    case response.downcase

    when "saved articles"
      saved_articles(user)
    when "topics"
      puts "topics moethod here"
    when 'exit'
      puts "Goodbye"
      break
    else
      "Invalid Input"
    end
  end

end



### Methods
def store_or_get_name(response)
  response = response.split
  user = User.find_by(first_name: response[0], last_name: response[1])
  user ? (return user) : (User.create(first_name: response[0], last_name: response[1]))
end

def saved_articles(user)
  puts "Here are your saved articles:"
# Getting articles
  binding.pry
  articles = user.articles
  return puts "You have no saved articles" if !articles.count
# Displaying articles
  articles.each_with_index do |article, i|
    puts "#{i + 1}. #{article.name}"
  end
# Options going forward
  loop do
    puts "Please select article by number, or back"
    response = gets.chomp
    return if response.downcase == 'back'
    if response.to_i > 0 && response.to_i < articles.count
      puts "You have selected an article, need selected article method"
      break
    else
      puts "Your input was invalid"
    end
  end

end

def topics

end




run
