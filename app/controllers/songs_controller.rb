class SongsController < ApplicationController
    before_action(:confirm_login, :current_musician)  
   
   

    def index
        @gs_array = current_musician.gig_songs.by_date.unique
    end


end
