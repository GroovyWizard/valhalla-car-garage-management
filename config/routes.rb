Rails.application.routes.draw do
  resources :providers
  devise_for :users
  devise_for :installs
  
  resources :sales do
   member do  
      get :finish_sale
      get :cancel_sale
   end
  end 

  resources :parts
  root "homepage#index"

  resources :vehicles
  post "/vehicles/new" => "vehicles#create"

  resources :clients
  post "/clients/new" => "clients#create"

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
  get "/dashboards/report/client" => "dashboards#client_report", as: "client_report"
  get "/dashboards/report/vehicle" => "dashboards#vehicle_report", as: "vehicle_report"
  get "/dashboards/report/service" => "dashboards#service_report", as: "service_report"
  get "/dashboards/report/sale" => "dashboards#sale_report", as: "sale_report"
  get "/dashboards/report/user" => "dashboards#user_report", as: "user_report"
end
