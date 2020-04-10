Rails.application.routes.draw do
  devise_for :employees
  devise_for :users
  resources :interventions
  resources :buildings

  resources :interventions do
    get :get_building, on: :collection
    get :get_battery, on: :collection
    get :get_column, on: :collection
    get :get_elevator, on: :collection
    get :get_employee, on: :collection
  end
get "pages/interventions" => "interventions#index"

  get "users/sign_out" => 'pages#index'

  delete "users/sign_out" => 'pages#index'

  mount RailsAdmin::Engine => "/admin", as: "rails_admin"

  root "pages#index"

  resources :leads

  # get 'userinfo' => 'pages#userinfo'

  delete "userinfo" => "pages#destroy"

  delete "index" => "pages#destroy"

  post "root" => "root#sendInformation"

  post "index" => "pages#create"

  post "index" => "pages#create"
  mount Blazer::Engine, at: "blazer"

  get "home" => "pages#home"

  get "corporate" => "pages#corporate"

  get "residential" => "pages#residential"

  get "intervention" => "interventions#new"

  post "intervention" => "interventions#create"

  get "submission" => "quotes#submission"

  post "submission" => "quotes#create"

  get "employee" => "pages#employee"

  get "submission" => "pages#submission"

  get "index" => "pages#index"

  get "users/index" => "pages#index"

  get "users/index" => "pages#index"

  get "employee" => "pages#employee"

  get "dashboard" => "pages#dashboard"

  resources :geolocations

  get "get_courses_by_location/:location_id", to: "courses#get_courses_by_location"

  get "/course_search" => "courses#course_search"
end
