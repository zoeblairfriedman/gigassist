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

      def googleAuth
        omni = self.request.env["omniauth.auth"][:info][:name]
        @musician = Musician.find_or_create_by(name: omni) do |m|
          m.password = "make a random generator eventually please"
        end
        if @musician.save
          session[:user_id] = @musician.id
          redirect_to musician_path(@musician)
        else
          @errors = "A user by this name already exsists"
          redirect_to "/signup"
        end
      end

    def destroy
        session.clear
        redirect_to "/login"
    end

end
