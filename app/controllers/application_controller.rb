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
        @user = User.find_by(user_email: params[:user_email])
        if @user
            session[:user_id] = @user.id
            
            redirect '/login'
        else
            @user = User.create(params)
            session[:user_id] = User.last.id
            
            erb :reviews
        end
    end

    get '/login' do
        erb :login
    end
    
    post '/login' do
        @user = User.find_by(user_email: params[:user_email])
    
        @reviews = Review.all
        erb :reviews
    end

    get '/reviews' do
        @reviews = Review.all
        
        erb :reviews
    end
    
    get '/reviews/new' do
        @user_id = session[:user_id]
        
        erb :new
    end
    
    get '/reviews/:id' do
    
    end

    get '/reviews/:id/edit' do
        erb :edit
    end
    
    post '/reviews/new' do
        binding.pry
        @review = Review.create(params)
            
        redirect '/reviews'
    end

    patch '/reviews/:id/edit' do

        redirect '/reviews/#{review.id}'
    end

    delete '/reviews/:id' do

        redirect '/reviews'
    end

end