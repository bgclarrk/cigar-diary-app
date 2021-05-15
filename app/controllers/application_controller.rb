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

    get '/login' do
        erb :login
    end
    
    get '/show' do
        @reviews = Review.all
        
        erb :show
    end

    post '/show' do
        @user = User.find_by(user_email: params[:user_email])
        if @user
            session[:user_id] = @user.id

            redirect '/login'
        else
            @user = User.new(params)
            @user.save
            session[:user_id] = User.last.id

            erb :show
        end
    end
    
    get '/new' do
        erb :new
    end

end