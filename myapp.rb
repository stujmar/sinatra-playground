require 'rubygems'
require 'sinatra'
require "sinatra/reloader" if development?

get '/' do
    'Hello world!'
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