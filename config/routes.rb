NkuRails::Application.routes.draw do

  resources :users, :sessions
  
  root to: "welcome#index"
end

