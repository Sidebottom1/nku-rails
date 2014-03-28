NkuRails::Application.routes.draw do
  get "logout" => "sessions#destroy", :as => "logout"
  resources :sessions, :attendances, :assignments
  resources :users do
    get 'seating_chart', on: :collection
  end
  resources :assignments do
    post 'upload', on: :collection
  end
  
  root to: "users#seating_chart"
end

