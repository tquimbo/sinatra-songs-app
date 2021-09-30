class SongsController < ApplicationController

    # get "/songs" do
    #     @songs = Songs.all
    #     erb :"songs/index.html"
    # end

    get "/songs" do
        # if params[:search]
        #   @songs = Song.where('name LIKE ?', "%#{params[:search]}%")
        # else
        #   @songs = Song.all
        # end
        # erb :"songs/index.html"
        @songs = Song.all
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

#   patch "/songs/:id" do
#     song = Song.find(params[:id])
#     song.update(params[:song])
#     redirect "/songs/#{song.id}"
    
#   end

patch "/songs/:id" do
    song = Song.find(params[:id])
    if song.user == current_user
      if song.update(params[:song])
        redirect "/songs/#{song.id}"
      else
        flash[:errors] = song.errors.full_messages
        redirect "/songs/#{song.id}/edit"
      end
    end
end
  

  delete "/songs/:id" do
    song = Song.find(params[:id])
    song.destroy
    redirect "/songs/#{song.id}"
  end
      
   


   

end