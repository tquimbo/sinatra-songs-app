class SongsController < ApplicationController

  get "/songs/new" do
    redirect_if_not_logged_in
    @song = Song.new
    erb :"songs/new.html"
  end

  post "/songs" do
    song = current_user.songs.create(params[:song])
    if song.valid?
      redirect "/songs/#{song.id}"
    else
      flash[:errors] = song.errors.full_messages
    redirect "/songs/new"
    end
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
        binding.opry
        erb :"songs/edit.html"
  end  


  patch "/songs/:id" do
      song = Song.find(params[:id])

      if song.user == current_user
        if song.update(params[:song])
          redirect "/songs/#{song.id}"
        else
          flash[:errors] = xong.errors.full_messages
          redirect "/songs/#{song.id}/edit"
        end
        else
          "Puts you are unable to edit another person's song."
        end
      end
   

delete "/songs/:id" do
  song = Song.find(params[:id])
  if song.user == current_user
  song.destroy
  else 
    puts "You cannot delete other people's songs"
  redirect "/songs"
end
  

end

end