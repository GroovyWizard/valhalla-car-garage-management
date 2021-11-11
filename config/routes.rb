Rails.application.routes.draw do
   root "homepage#index"
   
   resources :vehicles
   post '/vehicles/new' => 'vehicles#create'
   
   resources :clients
   
   resources :services do
      resources :tasks
   end
   
   resources :dashboard,
      only: [:show, :index]
end
