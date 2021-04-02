class GigsController < ApplicationController

before_action(:confirm_login, :current_musician)  

def new
    @gig = Gig.new
    @bands = Band.all
    @songs = Song.all
    20.times do 
        @gig.gig_songs.build
    end
end

def create
    @gig = Gig.new(gig_params)
    if !current_musician.bands.include?(@gig.band)
        current_musician.bands << @gig.band
    end
    if @gig.save
        flash[:message] = "Rock. Gig Saved!" 
        redirect_to gig_path(@gig)
    else
        20.times do 
            @gig.gig_songs.build
        end
        @bands = Band.all
        @songs = Song.all
        render :new
    end
end

def edit 
    @bands = Band.all
    @songs = Song.all
    @gig = Gig.find_by(id: params[:id])
    bouncer
    20.times do 
        @gig.gig_songs.build
    end
end

def update
    @gig = Gig.find_by(id: params[:id])
    if !current_musician.bands.include?(@gig.band)
        current_musician.bands << @gig.band
    end
    if @gig.update(gig_params)
        redirect_to gig_path(@gig)
    else
        @bands = Band.all
        @songs = Song.all
        render :edit
    end  
end

def show
    @gig = Gig.find_by(id: params[:id])
    bouncer
    @gig_songs = @gig.gig_songs
end

def index
    @gigs = @musician.gigs
    @gigs = @musician.gigs.by_date.not_over
    @songs = @musician.songs
    @bands = @musician.bands
end


#what should go here??? if it's gig_song it will need song_id, gig_id, original boolean, and notes
def gig_params
    params.require(:gig).permit(:venue, :date, :band_name, gig_songs_attributes: [:original, :notes, :id, :song_name, :gig_id])
end

end
