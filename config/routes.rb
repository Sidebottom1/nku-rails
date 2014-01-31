NkuRails::Application.routes.draw do

  resources :users
    resources :comments
  
  root to: "welcome#index"
end

