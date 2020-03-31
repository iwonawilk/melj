class Admin::EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :destroy, :update]
  before_action :event_params, only: [:create, :update]
  http_basic_authenticate_with name: ENV['ADMIN_NAME'], password: ENV['ADMIN_PASSWORD']
  def index
    @events = Event.order(updated_at: :desc)
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to admin_events_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @event.update(event_params)
    redirect_to admin_events_path
  end

  def destroy
    @event.destroy
    redirect_to admin_events_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :image)
  end

  def find_event
    @event = Event.find(params[:id])
  end
end
