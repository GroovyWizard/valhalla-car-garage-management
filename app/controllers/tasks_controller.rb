class TasksController < ApplicationController
    def create
        @service = Service.find(params[:service_id])
        @task = @service.tasks.create(tasks_params)
        redirect_to service_path(@service)
    end

    private
        def tasks_params
            params.require(:tasks).permit(:title, :description, :status, :estimative)
        end
end
w