class EventController < ApplicationController

  def get_location
  	
  	@ip = request.remote_ip
  	@location = Geocoder.search(@ip)
  	@results = @location.first.coordinates

  end

end
