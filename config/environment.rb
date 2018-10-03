require 'bundler'
require 'news-api'
require 'json'
require 'pry'
require 'open-uri'
require 'launchy'
Bundler.require
require_all 'app'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.sqlite3')
ActiveRecord::Base.logger = nil
