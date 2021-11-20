Rails.application.routes.draw do
   root "homepage#index"
   
   resources :vehicles
   post '/vehicles/new' => 'vehicles#create'
   
   resources :clients
   post '/clients/new' => 'clients#create'

   resources :services do
      resources :tasks
   end
   
   resources :dashboard,
      only: [:show, :index]
   get '/dashboard/report/client' => 'dashboard#client_report', as: 'client_report'
   get '/dashboard/vehicle/client' => 'dashboard#vehicle_report', as: 'vehicle_report'
   get '/dashboard/service/client' => 'dashboard#service_report', as: 'service_report'

end
