class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @event_id = @event.id
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event), notice: "Evento criado com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path, notice: "Evento atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: "Evento excluido com sucesso!"
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date, :location_id, :photo)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
