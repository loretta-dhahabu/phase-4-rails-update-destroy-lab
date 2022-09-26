class PlantsController < ApplicationController

  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = Plant.find_by(id: params[:id])
    render json: plant
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  #PATCH/plants/:id
  def update
    #find the plant
    plant = Plant.find_by(id:params[:id])
    if plant
      #update plant
      plant.update(plant_params)
      render json: plant, status: :created
    else
      render json: {error: "plant not found"}, status: :not_found
    end
  end

  #DELETE/plants/:id
  def destroy
    #find the plant to be destroyed
    plant = Plant.find_by(id:params[:id])
    if plant
      #destroy
      plant.destroy
      head :no_content
      else
        render json: {error: "plant not found"}, status: :not_found
    end 
  end

  private

  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end
end
