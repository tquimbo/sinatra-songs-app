class UsersController < ApplicationController

  get "/users" do
    @users = User.all
    erb :"users/index.html"
  end

  get "/users/new" do
    erb :"users/new.html"
  end

  get "/users/:id" do
    @user = User.find(params[:id])
    erb :"users/show.html"
  end


  # # GET: /users
  # get "/users" do
  #   erb :"/users/index.html"
  # end

  # # GET: /users/new
  # get "/users/new" do
  #   erb :"/users/new.html"
  # end

  # POST: /users
  post "/users" do
    user = User.new(params)
    if user.save
      flash[:success] = ["Account successfully created!"]
      session[:user_id] = user.id
      redirect "/"
    else
      # here's where we handle errors
      flash[:errors] = user.errors.full_messages
      redirect "/users/new"
    end
  end
  
  # GET: /users/5
  # get "/users/:id" do
  #   erb :"/users/show.html"
  # end

  # # GET: /users/5/edit
  # get "/users/:id/edit" do
  #   erb :"/users/edit.html"
  # end

  # # PATCH: /users/5
  # patch "/users/:id" do
  #   redirect "/users/:id"
  # end

  # # DELETE: /users/5/delete
  # delete "/users/:id/delete" do
  #   redirect "/users"
  # end
end
