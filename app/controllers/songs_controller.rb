class SongsController < ApplicationController

    get "/songs" do
        @songs = Songs.all
        erb :"songs/index.html"
    end

    get "/songs" do
        if params[:search]
        # if we're searching, only render some sharks
          @songs = Song.where('name LIKE ?', "%#{params[:search]}%")
        else
        # otherwise render all sharks
          @songs = Song.all
        end
        erb :"songs/index.html"
      end

      get "/songs/new" do
        redirect_if_not_logged_in
        @songs = Song.new
        erb :"sharks/new.html"
      end
    


end