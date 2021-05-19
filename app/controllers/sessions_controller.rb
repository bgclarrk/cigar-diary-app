class SessionsController < ApplicationController

    get '/login' do
        erb :"/sessions/login"
    end
    
    post '/login' do
        @user = User.find_by(user_email: params[:user_email])
        if @user
            @reviews = Review.all

            redirect '/reviews'
        else
            redirect '/'
        end
    end
    
    get '/logout' do
        session.clear

        redirect '/login'
    end

end