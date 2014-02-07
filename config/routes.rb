NkuRails::Application.routes.draw do
  get "logout" => "sessions#destroy", :as => "logout"
  resources :users, :sessions
  
  root to: "welcome#index"
end

