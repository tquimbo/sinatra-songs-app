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

      post "/songs" do
        song = current_user.songs.create(params[:song])
       redirect "/songs/#{song.id}"
      end   

      
        get "/songs/:id/edit" do
            @song = Song.find(params[:id])
            erb :"songs/edit.html"
        end

  patch "/songs/:id" do

  end
      
   

end