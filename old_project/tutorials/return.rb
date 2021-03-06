require 'rubygems'
require 'sinatra'
require "sinatra/reloader" if development?

# Return Values
class Stream
    def each
        100.times { |i| yield "#{i}\n" }
    end
end

get '/who-is-the-smartest' do
    "Ally"
end

get('/') { Stream.new }

# Custom Route Matchers

# class AllButPattern
#     Match = Struct.new(:captures)

#     def initialize(except)
#         @exceopt = except
#         @captures = Match.new([])
#     end

#     def match(str)
#         @capture unless @except === str
#     end
# end

# def all_but(pattern)
#     AllButPattern.new(pattern)
# end
# get all_but("/index") do
#     # ...
# end

# or 

# get // do
#     pass if request.path_info == "/index"
#     # ...
# end

# or using a negative look ahead:

get %r{(?!/index)} do
    # ...
end

# Static Files

set :public_folder, __dir__ + '/styles' # can't get to work

# Views / Template

# link to a .erb file that lives in /views
get '/home' do
    erb :index
end

# or embed the template content directly
get '/time' do
    code = "<%= Time.now %>"
    erb code
end



# Any options not understood by Sinatra will be passed on to the engine:
# get '/html' do
#     haml :html, :format => :html5
# end