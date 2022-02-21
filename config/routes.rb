Rails.application.routes.draw do
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
   
   resources :dashboard,
      only: [:show, :index]
   get '/dashboard/report/client' => 'dashboard#client_report', as: 'client_report'
   get '/dashboard/vehicle/client' => 'dashboard#vehicle_report', as: 'vehicle_report'
   get '/dashboard/service/client' => 'dashboard#service_report', as: 'service_report'
   get '/dashboard/parser/vehicle' => 'dashboard#vehicle_excel_parser', as: 'vehicle_excel_parser'      
end
