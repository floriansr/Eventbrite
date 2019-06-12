class HeaderImagesController < ApplicationController
  def create
  	@event = Event.find(params[:event_id])
    @event.header_image.attach(params[:header_image])
    redirect_to(event_path(@event))
  end
end
