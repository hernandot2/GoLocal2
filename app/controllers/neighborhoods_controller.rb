class NeighborhoodsController < ApplicationController
  before_action :set_neighborhood, only: [:show, :edit, :update, :destroy]

  def index
    @neighborhoods = Neighborhood.all
  end

  def show
    @locations = @neighborhood.locations
    @events = Event.joins(location: :neighborhood).where("neighborhoods.id = ?", @neighborhood.id)
  end

  def new
    @neighborhood = Neighborhood.new
  end

  def create
    @neighborhood = Neighborhood.new(neighborhood_params)
    if @neighborhood.save
      redirect_to neighborhoods_path(@neighborhood), notice: 'Bairro criado com sucesso!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @neighborhood.update(neighborhood_params)
      redirect_to neighborhoods_path, notice: 'Bairro atualizado com sucesso!'
    else
      render :edit
    end
  end

  def destroy
    @neighborhood.destroy
    redirect_to neighborhoods_path, notice: 'Bairro excluído com sucesso!'
  end

  private

  def neighborhood_params
    params.require(:neighborhood).permit(:name, :city_id, :description, :photo)
  end

  def set_neighborhood
    @neighborhood = Neighborhood.find(params[:id])
  end
end
