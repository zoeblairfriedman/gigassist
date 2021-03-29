class GigsController < ApplicationController

def new
    @gig = Gig.new
    @bands = Band.all
    @songs = Song.all
end

def create
    @gig = Gig.create(gig_params)
    if @gig.save 
        redirect_to gig_path(@gig)
    else
        render :new
    end
end

def show
    @gig = Gig.find_by(id: params[:id])
end


def gig_params
    params.require(:gig).permit(:venue, :date, :band_name)
end

end
