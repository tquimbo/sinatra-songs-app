class UsersController < ApplicationController

  get "/users" do
    @users = User.all
    erb :"users/index.html"
  end

  get "/profile" do
    redirect "/users/#{current_user.id}"
  end

  get "/users/new" do
    erb :"users/new.html"
  end

  get "/users/:id" do
    @user = User.find(params[:id])
    erb :"users/show.html"
  end

  post "/users" do
    user = User.new(params)
    if user.save
      flash[:success] = ["Account successfully created!"]
      session[:user_id] = user.id
      redirect "/"
    else
      flash[:errors] = user.errors.full_messages
      redirect "/users/new"
    end
  end

end
