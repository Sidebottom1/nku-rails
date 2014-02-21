NkuRails::Application.routes.draw do
  get "logout" => "sessions#destroy", :as => "logout"
  resources :users, :sessions, :attendances
  
  root to: "users#index"
end

