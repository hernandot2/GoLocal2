class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def index
    category = params[:category]
    city_id = params[:city]
    neighborhood_id = params[:neighborhood]
    if category.present?
      if city_id.present?
        @locations = Location.joins(neighborhood: :city).where(category: category).where("cities.id = ?", city_id)
      elsif neighborhood_id.present?
        @locations = Location.where(category: category).where(neighborhood_id: neighborhood_id)
      else
        @locations = Location.where(category: category)
      end
    else
      @locations = Location.all
    end
  end

  def show
    @location = Location.find(params[:id])
    @neighborhood = @location.neighborhood # Supondo que Location pertence a Neighborhood
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
    params.require(:location).permit(:name, :address, :description, :category, :photo)
  end

  def set_location
    @location = Location.find(params[:id])
  end
end
