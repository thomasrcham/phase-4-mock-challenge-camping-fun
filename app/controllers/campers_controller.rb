class CampersController < ApplicationController
  def index
    render json: Camper.all, status: :ok
  end

  def show
    render json: Camper.find(params[:id]),
           serializer: CamperActivitySerializer,
           status: :ok
  end

  def create
    camper = Camper.create!(camper_params)
    render json: camper, status: :created
  end

  private

  def camper_params
    params.permit(:name, :age)
  end
end
