class SessionsController < ApplicationController
    require 'rack-flash'
    use Rack::Flash


    get '/login' do
        erb :"/sessions/login"
    end
    
    post '/login' do
        flash[:alerts] = 'Incorrect email and/or password. Please try again or <a href="/" class="alert-link">sign up</a>.'

        @user = User.find_by(user_email: params[:user_email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            @reviews = Review.all

            redirect '/reviews'
        else
            redirect '/login'
        end
    end

    get '/logout' do
        session.clear

        redirect '/login'
    end

end