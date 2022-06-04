class TasksController < ApplicationController
    def index 
        @tasks = Task.all.to_json
    end 
    
    def new 
        @tasks = Task.pluck(:title).sort
        @service = Service.find(params[:service_id])
        @task = Task.new
    end

    def create
        @service = Service.find(params[:service_id])
        @task = @service.tasks.create(task_params)
        
        if @task.valid?
            flash[:success] = "Tarefa criada com sucesso"
            redirect_to service_path(@service)
        else
            flash[:errors] = @task.errors.full_messages            
            redirect_to service_path(@service)
        end
    end

    def edit
        @task = Task.find(params[:id])
        @service = @task.service
    end

    def update
        @task = Task.find(params[:id])
        if @task.update(task_params)
            redirect_to action: "show"
        else
            redirect_to action: "edit"
        end
    end

    def show
        @task = Task.find(params[:id])
        @service  = Service.find(params[:service_id])
    end
    
    def destroy
        @service = Service.find(params[:service_id])
        @task = @service.tasks.find(params[:id])
        @task.destroy
        redirect_to service_path(@service)
    end

    def finish_task
        @task = Task.find(params[:id])
        @service = Service.find(@task.service_id)
        @task.update(status: true, finish_date: DateTime.now())
        flash[:notice] = "Tarefa concluida!"
        redirect_to service_task_path(@service)
    end

    private
        def task_params
            params.require(:task).permit(:title, :description, :status, :estimative, :service_id, :finish_date)
        end
end
