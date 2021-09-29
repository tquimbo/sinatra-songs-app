class SongsController < ApplicationController

    # get "/songs" do
    #     @songs = Songs.all
    #     erb :"songs/index.html"
    # end

    get "/songs" do
        if params[:search]
          @songs = Song.where('name LIKE ?', "%#{params[:search]}%")
        else
          @songs = Song.all
        end
        erb :"songs/index.html"
      end

      get "/songs/new" do
        @song = Song.new
        erb :"songs/new.html"
      end
      
   

end