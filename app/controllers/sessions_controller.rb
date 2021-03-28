class SessionsController < ApplicationController
    def new
    end

    def create
        @musician = Musician.find_by(name: params[:musician][:name])
        if @musician && @musician.authenticate(params[:musician][:password])
          session[:user_id] = @musician.id
          redirect_to musician_gigs_path(@musician)
        elsif @musician
          @errors = ["Invalid Password"]
          render :new
        else
          @errors = ["Invalid Username"]
          render :new
        end
      end

    def destroy
        session.clear
        redirect_to "/signup"
    end

end
