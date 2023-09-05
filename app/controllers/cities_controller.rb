class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]

  def index
    @cities = City.all
  end

  def show
    authorize @city
    @events = Event.joins(location: { neighborhood: :city }).where("cities.id = ?", @city.id)
    @neighborhoods = @city.neighborhoods
    @locations = Location.joins(neighborhood: :city).where("cities.id = ?", @city.id)
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to city_path(@city), notice: 'A cidade foi criada com sucesso'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @city.update(city_params)
      redirect_to city_path(@city), notice: ' A cidade foi atualizada com sucesso'
    else
      render :edit
    end
  end

  def destroy

    @city.destroy
    redirect_to cities_path, notice: 'A cidade foi deletada com sucesso'
  end

  private

  def set_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name, :photo)
  end
end
