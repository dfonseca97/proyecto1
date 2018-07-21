class EventController < ApplicationController

  def get_location

  	@locations = Event.last(10)
  	
  end

  def store 

    respond_to do |format|

  	   latitude = params[:latitude]
  	   longitude = params[:longitude]

  	   @event = Event.new(user: 1, x: longitude, y: latitude)

  	   if @event.save then

  		   format.html{redirect_to event_get_location_path}

  	   else

  		   flash[:notice_booking_failed] = true
  		   redirect_to event_get_location_path

  	    end

    end

   end
   
end
