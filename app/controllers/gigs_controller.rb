class GigsController < ApplicationController
before_action(:confirm_login, :current_musician)
before_action(:set_songs_and_bands_all, only: [:new, :create, :edit, :update])
before_action(:set_gig, only: [:edit, :update, :show])
before_action(:set_list, only: [:edit])
before_action(:bouncer, only: [:edit, :show])


def new
    @gig = Gig.new
    set_list
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
        set_list
        render :new
    end
end

def edit 
end

def update
    if !current_musician.bands.include?(@gig.band)
        current_musician.bands << @gig.band
    end
    if @gig.update(gig_params)
        redirect_to gig_path(@gig)
    else
        render :edit
    end  
end

def show
    @gig_songs = @gig.gig_songs
end

def index
    @musician = Musician.find_by(id: params[:musician_id])
    @gigs = @musician.gigs
    @gigs = @musician.gigs.by_date.not_over
    @songs = @musician.songs
    @bands = @musician.bands
  
end


private 

def set_list
    20.times do 
        @gig.gig_songs.build
    end
end

def set_gig
    @gig = Gig.find_by(id: params[:id])
end

def set_songs_and_bands_all
    @bands = Band.all
    @songs = Song.all
end


def gig_params
    params.require(:gig).permit(:venue, :date, :band_name, gig_songs_attributes: [:original, :notes, :id, :song_name, :gig_id])
end

end
