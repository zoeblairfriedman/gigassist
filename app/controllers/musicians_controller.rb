class MusiciansController < ApplicationController

    def new
        @musician = Musician.new
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
        @musician = Musician.find_by(id: params[:id])
        @gigs = @musician.gigs
        @bands = @musician.bands
    end


    def musician_params
        params.require(:musician).permit(:name, :password, :password_confirmation)
    end
end
