class SessionsController < ApplicationController
    def new
    end

    def create
        binding.pry
        @musician = Musician.find_by(name: params[:musician][:name])
        binding.pry
        if @musican && @musician.authenticate(params[:musician][:password])
            binding.pry
            session[:user_id] = @musician.id
            redirect_to musician_gigs_path
        else
            binding.pry
            render :new
        end
    end

    def destroy
        session.clear
        redirect_to "/signup"
    end

end
