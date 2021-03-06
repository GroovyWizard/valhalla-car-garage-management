class VehiclesController < ApplicationController
  def index
    @vehicles_raw =
      Vehicle.search(params[:search])

    @vehicles =
      Kaminari.paginate_array(@vehicles_raw).page(params[:page])
  end

  def show
    @vehicle = Vehicle.find(params[:id])
    @services = @vehicle.services
  end

  def new
    @vehicle = Vehicle.new
    @clients = Client.all
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)

    if @vehicle.save
      redirect_to action: "index"
    else
      render :new
    end
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
    @clients = Client.all
  end

  def update
    @vehicle = Vehicle.find(params[:id])

    if @vehicle.update(vehicle_params)
      redirect_to action: "index"
    else
      redirect_to action: "edit"
    end
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy

    redirect_to action: "index"
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:search, :id, :model, :registration_plate, :client_id)
  end
end
