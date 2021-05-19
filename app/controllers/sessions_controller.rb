class SessionsController < ApplicationController

    get '/logout' do
        session.clear

        redirect '/login'
    end

end