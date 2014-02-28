NkuRails::Application.routes.draw do
  get "logout" => "sessions#destroy", :as => "logout"
  resources :sessions, :attendances, :users

    
  root to: "users#index"
end

