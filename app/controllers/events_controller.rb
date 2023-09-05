class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = policy_scope(Event)
  end

  def show
    authorize @event
    @event_id = @event.id
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    authorize @event
    if @event.save
      redirect_to event_path(@event), notice: "Evento criado com sucesso!"
    else
      render :new
    end
  end

  def edit
    authorize @event
  end

  def update
    authorize @event
    if @event.update(event_params)
      redirect_to event_path, notice: "Evento atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    authorize @event
    @event.destroy
    redirect_to events_path, notice: "Evento excluido com sucesso!"
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date, :location_id, :user_id, :neighborhood_id, :photo)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
