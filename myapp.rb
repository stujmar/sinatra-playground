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
  "Hello, #{c}!"
end

# Routes can have optional parameters:
get '/toasts/:format?' do
  # Matches "GET /posts/" and any extention "GET /post/json", "GET /posts/xml" etc
end # interesting don't know how to retrieve slug.

# Query parameters:
get '/posts' do
  # matches "GET /posts?title=foo&author=bar"
  title = params['title']
  author = params['author']
  # uses title and author variables; query is optional to the /posts route
  "#{title} #{author}"
end

# By the way, unless you disable the path traversal attack protection. the request path might be modified before matching against your routes?
# You may customize the Mustermann options used for a given route by passing in a :mustermann_opts hash:
get '\A/mustard\z', :mustermann_opts => { :type => :regexp, :check_anchors => false } do
  # Matches /posts exactly, with explicit anchoring
  "If you match an anchored pattern clab your hands?"
end

# Conditions
# Routes may include a variety of matching conditions, such as the user agent:
get '/food', :agent => /Songbird (\d\.\d)[\d\/]*?/ do
  "You're using Songbird version #{params['agent'][0]}"
end

get '/food' do
  "Matching non-songbird browers"
end

# Other available conditions are host_name and provides:
get '/', :host_name => /^admin\./ do
  "Admin Area, Access Denied!"
end

get '/', :provides => 'html' do
  haml :index
end

get '/', :provides => ['rss', 'atom', 'xml'] do
  builder :feed
end

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