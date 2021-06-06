class ApplicationController < Sinatra::Base
    require 'rack-flash'
    use Rack::Flash


    configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, ENV["SESSION_SECRET"]
    end

    get '/' do
        erb :'sessions/index'
    end
    
    post '/signup' do
        @user = User.find_by(user_email: params[:user_email])
        
        if @user
            session[:user_id] = @user.id
            
            redirect "/login"
        else
            @user = User.create(params)
            session[:user_id] = User.last.id
            
            redirect 'reviews/reviews'
        end
    end

    get '/reviews' do
        @reviews = Review.all

        erb :'reviews/reviews'
    end
    
    get '/reviews/new' do
        @user_id = session[:user_id]
        
        erb :'reviews/new'
    end
    
    get '/reviews/:id' do
        erb :'reviews/show'
    end

    get '/reviews/:id/edit' do
        erb :'reviews/edit'
    end
    
    post '/reviews/new' do
        @review = Review.create(params)
            
        redirect '/reviews'
    end

    patch '/reviews/:id/edit' do
        @review = Review.find_by_id(params[:id])
        @review.review_title = params[:review_title]
        @review.review_cigar = params[:review_cigar]
        @review.review_rating = params[:review_rating]
        @review.review_description = params[:review_description]
        @review.save

        redirect "/reviews/#{@review.id}"
    end

    delete '/reviews/:id' do
        review = Review.find_by_id(params[:id])
        review.delete

        redirect '/reviews'
    end

    helpers do

        def logged_in?
            !!session[:user_id]
        end

        def current_user?
            logged_in? && User.find(session[:user_id])
        end

    end

end