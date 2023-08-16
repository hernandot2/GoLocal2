class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def index
    @locations = Location.all
  end

  def show
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    @location.user = current_user
    if @location.save
      redirect_to location_path, notice: "Local criado com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to location_path, notice: "Local atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to locations_path, notice: "Local excluido com sucesso!"
  end

  private

  def location_params
    params.require(:location).permit(:name, :address, :description, :category)
  end

  def set_location
    @location = Location.find(params[:id])
  end
end
