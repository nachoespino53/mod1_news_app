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
      puts "saved article method here"
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

run
