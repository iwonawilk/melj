class EventsController < ApplicationController
  before_action :find_event, only: [:show]

  def index
    @events = Event.order(updated_at: :desc)
  end

  def show
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end
end
