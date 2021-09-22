class SessionsController < ApplicationController

      get "/login" do
        erb :"sessions/new.html"
      end

      get "/logout" do
        session.clear
        redirect "/"
      end


    end