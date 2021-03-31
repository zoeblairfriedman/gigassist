class SongsController < ApplicationController
    before_action(:confirm_login, :current_musician)  

    def index
        @gigs = current_musician.gigs.all
    end
    
end
