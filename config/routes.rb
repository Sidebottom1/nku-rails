NkuRails::Application.routes.draw do
  get "logout" => "sessions#destroy", :as => "logout"
  resources :sessions, :attendances, :users
  resources :user do
    get :attendances
  end
    
  root to: "users#index"
end

