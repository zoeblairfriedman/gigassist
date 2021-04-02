class ApplicationController < ActionController::Base
    #i thought i didn't need this if i have form_for?
    protect_from_forgery with: :exception

    helper_method(:current_musician, :confirm_login, :bouncer)

    def current_musician
        @musician = Musician.find_by(id: session[:user_id])
    end

    def confirm_login
      redirect_to "/login" if !current_musician
    end

    def bouncer
      if !in_band?
        flash[:message] = "You are not in this band"
        redirect_to musician_path(current_musician)
      end
    end

    def in_band?
      current_musician.bands.include?(@gig.band)
    end

end
