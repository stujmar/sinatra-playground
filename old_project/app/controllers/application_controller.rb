class ApplicationController < Sinatra::Base
    config do
        set :public_folder, 'public'
        set :views, 'app/views' enable :sessions
        set :session_secret, 'password_security'
    end

    get '/' do
        'Hello, World!'
    end
end