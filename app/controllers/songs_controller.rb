class SongsController < ApplicationController

    get "/songs/new" do
       redirect_if_not_logged_in
      @song = Song.new
      erb :"songs/new.html"
    end

    post "/songs" do
      song = current_user.songs.create(params[:song])
      redirect "/songs/#{song.id}"
    end   

    get "/songs" do
        if params[:search]
          @songs = Song.where('name LIKE ?', "%#{params[:search]}%")
        else
          @songs = Song.all
        end
        erb :"songs/index.html"
    end
    
    get "/songs/:id" do
      @song = Song.find(params[:id])
      erb :"songs/show.html"
    end

    get "/songs/:id/edit" do
          redirect_if_not_logged_in
          @song = Song.find(params[:id])
          erb :"songs/edit.html"
    end  

    patch "/songs/:id/edit" do
        song = Song.find(params[:id])
        if song.user == current_user
          if song.update(params[:song])
            redirect "/songs/#{song.id}"
          else
            flash[:errors] = song.errors.full_messages
            redirect "/songs/#{song.id}/edit"
          end
          redirect "/songs"
        end
     end
  
  delete "/songs/:id" do
    song = Song.find(params[:id])
    if song.user == current_user
    song.destroy
    redirect "/songs"
  end
    

end

end