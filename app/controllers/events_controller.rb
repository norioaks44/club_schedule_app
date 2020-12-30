class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]

  def index
    @events = Event.includes(:user)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    binding.pry
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    load_event
  end
  
  def edit
    load_event
  end
  
  def update
    load_event
    if @event.update(event_params)
      redirect_to event_path
    else
      render :edit
    end
  end
  
  def destroy
    load_event
    if @event.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def event_params
      params.require(:event).permit(:title_id, :start_time, :meeting_time_id, :info).merge(user_id: current_user.id)
  end

  def load_event
    @event = Event.find(params[:id])
  end

end
