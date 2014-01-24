NkuRails::Application.routes.draw do

  resources :posts
    resources :comments
  
  root to: "welcome#index"
end

