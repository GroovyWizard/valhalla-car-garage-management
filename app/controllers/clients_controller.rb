class ClientsController < ApplicationController
  def index
    @clients_raw = Client.search(params[:search])

    @clients =
      Kaminari.paginate_array(@clients_raw)
        .page(params[:page])
  end

  def show
    @client = Client.find(params[:id])
    @vehicles = @client.vehicles
    @sales = @client.sales
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to action: "index"
    else
      render :new
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])

    if @client.update(client_params)
      redirect_to action: "index"
    else
      redirect_to action: "edit"
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    redirect_to action: "index"
  end

  private

  def client_params
    params.require(:client).permit(:id, :name, :search, :document, :phone, :address)
  end
end
