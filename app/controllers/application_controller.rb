class ApplicationController < ActionController::Base
    #i thought i didn't need this if i have form_for?
    protect_from_forgery with: :exception
end
