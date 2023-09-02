class FavoritesController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def create
    @favorite = current_user.favorites.create(event_id: params[:event_id], location_id: params[:location_id])
    if @favorite.save
      render json: { favorited: true }
    else
      render json: { error: 'Não foi possível adicionar aos favoritos' }
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    render json: { favorited: false }
  end
end


  private

  def set_location
    @location = Location.find(params[:location_id])
  end
end
