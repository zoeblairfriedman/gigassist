class MusiciansController < ApplicationController

    def new
        @musician = Musician.new
    end

    def create
        @musician = Musician.new(musician_params)
        if @musician.save
            session[:user_id] = @musician.id
            redirect_to musician_gigs_path(@musician)
        else
            render :new
        end
    end


    def musician_params
        params.require(:musician).permit(:name, :password, :password_confirmation)
    end
end
