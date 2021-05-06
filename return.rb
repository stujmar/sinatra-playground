require 'rubygems'
require 'sinatra'
require "sinatra/reloader" if development?

# Return Values
class Stream
    def each
        100.times { |i| yield "#{i}\n" }
    end
end

get('/') { Stream.new }

# Custom Route Matchers

class AllButPattern
    Match = Struct.new(:captures)

    def initialize(except)
        @exceopt = except
        @captures = Match.new([])
    end

    def match(str)
        @capture unless @except === str
    end
end

def all_but(pattern)
    AllButPattern.new(pattern)
end
get all_but("/index") do
    # ...
end

# or 

get // do
    pass if request.path_info == "/index"
    # ...
end