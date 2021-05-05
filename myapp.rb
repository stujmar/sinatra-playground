require 'rubygems'
require 'sinatra'
require "sinatra/reloader" if development?

get '/' do
    'Hello world!'
end

get '/hello/:name' do
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params['name'] is 'foo' or 'bar'
  "Hello #{params['name']}!"
end

get '/bye/:name' do |n|
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params['name'] is 'foo' or 'bar'
  # n stores params['name']
  "Buh bye #{n}!"
end

# Route patterns may also include splat (or wildcard) parameters, accessible via the params['splat'] array:
get '/say/*/to/*' do
  # matches /say/hello/to/world
  params['splat']
end

# Or with block parameters:
get '/download/*.*' do |path, ext|
  [path, ext] # => ["path/to/file, "xml"]
end

# Route Matching with Regular Expressions:
get /\/hello\/([\w]+)/ do
  "Hello, #{params['captures'].first}!"
end

# Or with block parameter:
get %r{/what/([\w]+)} do |c|
  

post '/post' do
  # create something#
  end
  
  put '/put' do
  # replace something#
  end
  
  patch '/patch' do
  # modify something#
  end
  
  delete '/delete' do
  # annihilate something#
  end
  
  options '/options' do
  # appease something#
  end
  
  link '/link' do
  # affiliate something#
  end
  
  unlink '/unlink' do
  # separate something#
  end