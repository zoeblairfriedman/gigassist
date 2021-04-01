class SongsController < ApplicationController
    before_action(:confirm_login, :current_musician)  

    def index
        @gigs = current_musician.gigs
        @gs_array = []
        @gigs.each do |gig|
            gig.gig_songs.each do |gs|
               
                     @gs_array << gs
            end
        end
        @gs_array.sort_by { |gig| gig.date }
    end
    
end
