class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def create
    city = City.new(city_params)

    if city.save
      redirect_to cities_index_path
    else
      flash[:error] = city.errors.full_messages.join(", ")
      redirect_to cities_new_path
    end
  end

  def edit
    city_id = params[:id]

    @city = City.find_by_id(city_id)
  end

  def update
  end

  def destroy
    @city = City.delete
  end

  private
  def city_params
    params.require(:city).permit(:name, :address, :description, :longitude, :lattitude)
  end
end
