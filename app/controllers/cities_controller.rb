class CitiesController < ApplicationController
def index
  @cities = City.all
end

def show
  @city = City.find(params[:id])
end

def new
  @city = City.new
end

def create
  @city = City.new(city_params)

  if @city.save
    redirect_to city_path(@city), notice: 'City was successfully created.'
  else
    render :new
  end
end

def edit
  @city = City.find(params[:id])
end

def update
  @city = City.find(params[:id])

  if @city.update(city_params)
    redirect_to city_path(@city), notice: ' City was successfully updated'

  else
    render :edit
  end
end

def destroy
  @city = City.find(params[:id])
  @city.destroy

  redirect_to cities_path, notice: ' City was successfully destroyed'

end

private

def city_params

  params.require(:city).permit(:name)

end
end
