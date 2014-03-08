NkuRails::Application.routes.draw do
  get "logout" => "sessions#destroy", :as => "logout"
  resources :sessions, :attendances
  resources :users do
    get 'seating_chart', on: :collection
  end

    
  root to: "users#seating_chart"
end

