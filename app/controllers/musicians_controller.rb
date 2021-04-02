class MusiciansController < ApplicationController

    before_action(:confirm_login, only: [:show]) 
    before_action(:current_musician, except: [:new, :create])  

    def new
        @musician = Musician.new
    end

    def stats
    end

    def create
        @musician = Musician.new(musician_params)
        if @musician.save
            session[:user_id] = @musician.id
            redirect_to musician_path(@musician)
        else
            @errors = @musician.errors.full_messages
            render :new
        end
    end

    def show
        @gigs = @musician.gigs
        @songs = @musician.songs
        @bands = @musician.bands
    end

private

    def musician_params
        params.require(:musician).permit(:name, :password, :password_confirmation)
    end
end
