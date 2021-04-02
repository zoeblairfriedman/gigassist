class SongsController < ApplicationController
    before_action(:confirm_login, :current_musician)  
   
   

    def index
        @gigs = current_musician.gigs
        @gs_array = []
        @gigs.each do |gig|
            gig.gig_songs.each do |gs|  
                if !@gs_array.any?{|a| a.song_id == gs.song_id} 
                     @gs_array << gs
                end
            end
        end
        #this is not working
        @gs_array.sort_by { |gig| gig.gs_date }
        #maybe this instead? incorporate scope method?
        # @ordered_gigs = @gs_array.by_date
    end

    private

    # def gigs_by_date
    #     Gig.order("date DESC")
    # end

    # Gig.order("date DESC").where("musician_id == ?", current_musician.id)
    # Gig.where("musician_id == ?", current_musician.id).order('date DESC')
    # Author.find(10).books.reorder('year_published ASC')
    
    

    

end
