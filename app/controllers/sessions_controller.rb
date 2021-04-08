class SessionsController < ApplicationController
    def new
    end

    def welcome
    end

    def create
        @musician = Musician.find_by(email: params[:musician][:email])
        if @musician && @musician.authenticate(params[:musician][:password])
          session[:user_id] = @musician.id
          redirect_to musician_path(@musician)
        elsif @musician
          @errors = @musician.errors.full_messages
          @errors << "Invalid Password"
          render :new
        else
          @errors = ["Invalid Username"]
          render :new
        end
      end

      def googleAuth
        omni = self.request.env["omniauth.auth"][:info][:email]
        o_name = self.request.env["omniauth.auth"][:info][:name]
        @musician = Musician.find_or_create_by(email: omni) do |m|
          m.name = o_name
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
