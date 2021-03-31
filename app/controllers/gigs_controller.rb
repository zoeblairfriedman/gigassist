class GigsController < ApplicationController

before_action(:confirm_login, :current_musician)  

def new
    @gig = Gig.new
    @bands = Band.all
    @songs = Song.all
    #is this what I need for this? 
    @gig.gig_songs.build
end

def create
    @gig = Gig.create(gig_params)
    
    
    if !current_musician.bands.include?(@gig.band)
        current_musician.bands << @gig.band
    end
    if @gig.save 
        redirect_to gig_path(@gig)
    else
        render :new
    end
end

def show
    @gig = Gig.find_by(id: params[:id])
end

def index
    @gigs = @musician.gigs
    @songs = @musician.songs
    @bands = @musician.bands
end


#wtf should go here???
def gig_params
    binding.pry
    params.require(:gig).permit(:venue, :date, :band_name, gig_songs_attributes: [])
end

end
