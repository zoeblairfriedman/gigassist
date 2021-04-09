class SongsController < ApplicationController
    before_action(:confirm_login, :current_musician)  
   

    def index
        if params[:song]
            song = Song.find_by(name: params[:song])
            @gs_array = current_musician.gig_songs.by_date.unique.not_over.where("song_id == ?", song.id)
        else  
            @gs_array = current_musician.gig_songs.by_date.unique.not_over
        end
        
    end


end
