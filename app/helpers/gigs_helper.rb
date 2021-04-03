module GigsHelper 

      def show_date(gig)
        gig.date.strftime("%a %B %d, %Y")   
      end

      
end
