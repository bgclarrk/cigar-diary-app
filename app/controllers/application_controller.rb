class ApplicationController < Sinatra::Base

    configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, ENV["SESSION_SECRET"]
    end

    get '/' do
        erb :index
    end

    post '/' do
        user = User.new(params)
        user.save

        redirect 'show.erb'
    end

    get '/login' do
        erb :login
    end

    get '/new' do
        erb :new
    end

end