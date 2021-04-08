class ApplicationController < ActionController::Base
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
        flash[:message] = "You are not in this band and do not have access to view or edit this specific gig information"
        redirect_to musician_path(current_musician)
      end
    end

    def in_band?
      current_musician.bands.include?(@gig.band)
    end

end
