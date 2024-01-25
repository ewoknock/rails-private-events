class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[index]

  def index
    @events = Event.all.includes(:creator, :attendees)
  end

  def show
    @event = Event.includes(:attendees).find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :date_time)
  end
end