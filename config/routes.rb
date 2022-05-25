Rails.application.routes.draw do
  devise_for :users
  devise_for :installs
  resources :sales
  resources :parts
   root "homepage#index"
   
   resources :vehicles
   post '/vehicles/new' => 'vehicles#create'
   
   resources :clients
   post '/clients/new' => 'clients#create'

   resources :services do   
      resources :tasks do
      end
   end

   resources :tasks do 
      member do 
         get :finish_task
      end
   end

   resources :services do 
      member do 
         get :finish_service
      end
   end
   
   resources :dashboards
   get '/dashboards/report/client' => 'dashboards#client_report', as: 'client_report'
   get '/dashboards/vehicle/client' => 'dashboards#vehicle_report', as: 'vehicle_report'
   get '/dashboards/service/client' => 'dashboards#service_report', as: 'service_report'
end
