class MusiciansController < ApplicationController
    before_action(:confirm_login, only: [:show]) 
    before_action(:current_musician, except: [:new, :create])  

    def new
        @musician = Musician.new
    end

    def stats
        @next_gig = current_musician.gigs.by_date.not_over.first
        @most_played = nil
        # gigsongs = current_musician.gig_songs
        # binding.pry
        # gigsongs.by_count

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
            user = Musician.find_by(id: params[:id])
            if user == current_musician
                @gigs = @musician.gigs.not_over
                @songs = current_musician.gig_songs.unique.not_over.size
                @bands = @musician.bands
            else
                flash[:message] = "Denied."
                redirect_to musician_path(current_musician)
            end
    end

private

    def musician_params
        params.require(:musician).permit(:name, :password, :password_confirmation)
    end
end
