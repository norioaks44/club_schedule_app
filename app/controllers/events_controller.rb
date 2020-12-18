class EventsController < ApplicationController

  def index
    query = "SELECT * FROM events ORDER BY id DESC"
    @events = Event.find_by_sql(query)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path
    else
      render :edit
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def event_params
      params.require(:event).permit(:title_id, :start_time, :meeting_time_id, :info)  
  end
  
end
