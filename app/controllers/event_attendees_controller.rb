class EventAttendeesController < ApplicationController
  before_action :authenticate_user!

  def create
    event_id = event_attendee_params[:attended_event_id]
    
    attended = EventAttendee.find_by(event_attendee_params)
    if attended
      flash[:notice] = 'You are already attending this event'
      redirect_to event_path(event_id) and return
    end

    @event_attendee = current_user.event_attendees.build(event_attendee_params)
    @event_attendee.save
    redirect_to event_path(event_id)
  end

  private

  def event_attendee_params
    params.require(:event_attendee).permit(:attended_event_id, :event_attendee_id)
  end
end
