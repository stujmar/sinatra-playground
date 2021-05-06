require 'rubygems'
require 'sinatra'
require "sinatra/reloader" if development?

class Stream
    def each
        100.times { |i| yield "#{i}\n" }
    end
end

get('/') { Stream.new }