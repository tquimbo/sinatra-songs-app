require "./config/environment"

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV["SESSION_SECRET"]
    register Sinatra::Flash
  end
 
  get "/" do
    erb :welcome
  end

  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      logged_in? && User.find(session[:user_id])
    end
   
    def redirect_if_not_logged_in
      redirect "/login" if !current_user
    end

  end

  # post "/songs/:id" do
  #   song = current_user.songs.create(params[:song])
  #   redirect "/songs/#{song.id}"
  # end


end