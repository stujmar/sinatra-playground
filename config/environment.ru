require 'bundler'
Bundler.require
ActiveRecord::Base.establist_connection(
    :adapter => 'sqlite3',
    :database => 'db/development.sqlite'
)

require_all 'app'