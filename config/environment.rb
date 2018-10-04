require 'bundler'
require 'news-api'
require 'json'
require 'pry'
require 'open-uri'
require 'launchy'
Bundler.require
# require_all 'app'

Dir[File.join(File.dirname(__FILE__), "../app", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../app/controllers", "*.rb")].each {|f| require f}


ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.sqlite3')
ActiveRecord::Base.logger = nil
