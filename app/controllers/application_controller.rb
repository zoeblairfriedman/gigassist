class ApplicationController < ActionController::Base
    #i thought i didn't need this if i have form_for?
    protect_from_forgery with: :exception

    helper_method(:current_musician)

    def current_musician
        @current_musician = Musician.find_by(id: session[:user_id])
      end
end
