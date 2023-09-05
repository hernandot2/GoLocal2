class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]

  def index
    @favorites = policy_scope(Favorite).where(user: current_user)
  end

  def create
    @location = Location.find(params[:location_id])
    @favorite = Favorite.new(user: current_user, location: @location)
    authorize @favorite
    @favorite.save!
    redirect_to favorites_path, notice: 'Localização favoritada com sucesso!'
  end

  def destroy
    authorize @favorite
    @favorite.destroy
    redirect_to favorites_path, notice: 'Favorito excluido com sucesso!'
  end

  private

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end

  def set_location
    @location = Location.find(params[:location_id])
  end
end
