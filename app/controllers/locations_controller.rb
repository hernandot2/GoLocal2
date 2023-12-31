class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy, :approve]
  
  def index
    @category = params[:category]
    @city_id = params[:city]
    @neighborhood_id = params[:neighborhood]
    @neighborhood = Neighborhood.where("neighborhood.id = ?", @neighborhood_id)
    @locations = policy_scope(Location).where(approved: true)
    if @category.present?
      if @city_id.present?
        @locations = @locations.joins(neighborhood: :city).where(category: @category).where("cities.id = ?", @city_id)
      elsif @neighborhood_id.present?
        @locations = @locations.where(category: @category).where(neighborhood_id: @neighborhood_id)
      else
        @locations = @locations.where(category: @category)
      end
    else
      @locations
    end
    @markers = @locations.geocoded.map do |location|
      {
        id: location.id,
        lat: location.latitude,
        lng: location.longitude,
        info_window_html: render_to_string(partial: "locations/info_window", locals: { location: location }),
        marker_html: render_to_string(partial: "locations/marker")
      }
    end
    render layout: "map_page"
  end

  def show
    authorize @location
    @neighborhood = @location.neighborhood
    @marker = {
      id: @location.id,
      lat: @location.latitude,
      lng: @location.longitude,
      info_window_html: render_to_string(partial: "locations/info_window", locals: { location: @location }),
      marker_html: render_to_string(partial: "locations/marker")
    }
    @location = Location.find(params[:id])
    @location_id = @location.id
  end

  def new
    @location = Location.new
    authorize @location
  end

  def create
    @location = Location.new(location_params)
    @location.user = current_user
    @location.approved = false if @location.approved.nil?
    authorize @location
    if @location.save
      redirect_to location_path(@location), notice: "Local criado com sucesso!"
    else
      render :new
    end
  end

  def edit
    authorize @location
  end

  def update
    authorize @location
    if @location.update(location_params)
      redirect_to location_path, notice: "Local atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    authorize @location
    @location.destroy
    redirect_to locations_path, notice: "Local excluido com sucesso!"
  end

  def approve
    authorize @location
    @location.approved = true
    if @location.save!
      redirect_to profile_path(current_user), notice: "Local aprovado com sucesso!"
    else
      redirect_to location_path
    end
  end

  # def toggle_favorite
  #   Rails.logger.debug "toggle_favorite called"
  #   @location = Location.find(params[:id])
  #   favorite = current_user.favorites.find_by(location_id: @location.id)

  #   if favorite
  #     favorite.destroy!
  #     render json: { favorited: false }
  #   else
  #     new_favorite = current_user.favorites.new(location_id: @location.id)
  #     if new_favorite.save
  #       render json: { favorited: true }
  #     else
  #       render json: { error: new_favorite.errors.full_messages }, status: :unprocessable_entity
  #     end
  #   end
  # end

  private

  def location_params
    params.require(:location).permit(:name, :address, :description, :neighborhood_id, :category, :photo, :approved)
  end

  def set_location
    @location = Location.find(params[:id])
  end
end
