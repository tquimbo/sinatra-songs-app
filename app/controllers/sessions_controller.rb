class SessionsController < ApplicationController

    get "/logout" do
        session.clear
        redirect "/"
      end

    end