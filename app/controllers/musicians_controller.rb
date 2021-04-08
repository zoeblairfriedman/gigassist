class MusiciansController < ApplicationController
    before_action(:confirm_login, only: [:show]) 
    before_action(:current_musician, except: [:new, :create, :allstar])  

    def new
        @musician = Musician.new
    end

    def stats
        if current_musician.gigs.count != 0 && current_musician.songs.count != 0
            @next_gig = current_musician.gigs.by_date.not_over.first
            @most_played = song_counts.sort_by {|k,v| v}.reverse.first[0].name
            @count = song_counts.sort_by {|k,v| v}.reverse.first[1]
            @busiest = current_musician.bands.most_gigs.first
            @busiest_count = @busiest.gigs.size
        end
        @list = Musician.all.sort_by{|musician| musician.gigs.length}.reverse.take(5)
        @allstar = @list.first
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

    def song_counts
        counts = current_musician.songs.each_with_object(Hash.new(0)) do |song, new_hash|
            new_hash[song] += 1  
        end
        counts
    end


    def musician_params
        params.require(:musician).permit(:name, :email, :password, :password_confirmation)
    end
end
