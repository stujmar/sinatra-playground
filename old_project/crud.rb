require 'rubygems'
require 'sinatra'
require "sinatra/reloader" if development?

get "/hello" do
    [200, {}, "Hello from Sinatra!"]
end
  
post "/hello" do
    [200, {}, "Hello from a post-Sinatra world!"]
end