class ServicesController < ApplicationController
    def index 
        @services = Service.all.order('created_at DESC')
    end

    def show
        @service = Service.find(params[:id])
    end

    def new
        @service = Service.new
        @vehicles = Vehicle.all
    end

    def create
        @service = Service.new(service_params)
    
        if @service.save
            redirect_to @service
        else
            redirect_to action: "new"
        end
        
    end

    def edit
        @service = Service.find(params[:id])
        @vehicles = Vehicle.all
    end

    def update
        @service = Service.find(params[:id])

        if @service.update(service_params)
            redirect_to @service
        else 
            redirect_to action: "edit"
        end

    end

    def destroy
        @service = Service.find(params[:id])
        @service.destroy
        
        redirect_to action: "index"
    end

    def finish_service
        @service = Service.find(params[:id])
        @service.update(status: true, finish_date: DateTime.now())
        flash[:notice] = "Serviço concluido!"
        redirect_to service_path(@service)
    end

    private
        def service_params
            params.require(:service).permit(:id, :title, :finish_date, :status, :estimative, :value, :vehicle_id)
        end
end
