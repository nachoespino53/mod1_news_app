require_relative '../config/environment'
require 'pry'

def run
  puts "Welcome, please tell us your name"
  loop do
  response = gets.chomp
  names_array = name_array(response)
  names_array ? (
    store_or_get_name(names_array)
    break
    ) : (puts "Please enter valid name")
  end
end


def name_array(name)
  name.split.count == 2 ? (return name.split) : (return nil)
end

def store_or_get_name(response)
  User.find_by(first_name: response[0], last_name: response[1]) ? (puts "Welcome back") : (User.create(first_name: response[0], last_name: response[1]))
end

run
