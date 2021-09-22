class SessionsController < ApplicationController

      get "/login" do
        erb :"sessions/new.html"
      end

      post "/sessions" do
        user = User.find_by_username(params[:username])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect "/"
        else
          redirect "/login"
        end
      end

      get "/logout" do
        session.clear
        redirect "/"
      end

    end