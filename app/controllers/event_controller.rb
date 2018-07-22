class EventController < ApplicationController

  def get_location

  	@locations = Event.last(10)
  	
  end

  def store 

    respond_to do |format|

  	   latitude = params[:latitude]
  	   longitude = params[:longitude]

  	   @event = Event.new(user: current_user.id, y: latitude, x: longitude)

  	   if @event.save then

  		   format.html{redirect_to event_get_location_path}

  	   else

  		   flash[:notice_booking_failed] = true
  		   redirect_to event_get_location_path

  	    end

    end

  end

  def map

    @user_events = Event.where(user: current_user.id)
    @link = "https://www.google.es/maps/dir/"

    @user_events.each do |coords|
      
      @link.concat("'" + coords.y.to_s + "," + coords.x.to_s + "'" + "/")
    
    end
    
    redirect_to @link

  end

end
