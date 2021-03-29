class SessionsController < ApplicationController
    def new
    end

    def create
        @musician = Musician.find_by(name: params[:musician][:name])
        if @musician && @musician.authenticate(params[:musician][:password])
          session[:user_id] = @musician.id
          redirect_to musician_path(@musician)
        elsif @musician
          @errors = ["Incorrect Password"]
          render :new
        else
          @errors = ["Incorrect Username"]
          render :new
        end
      end

    def destroy
        session.clear
        redirect_to "/login"
    end

end
