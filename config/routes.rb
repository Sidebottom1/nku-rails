NkuRails::Application.routes.draw do

  resources :posts
    resources :comments
  #post GET    /posts/:id(.:format)      posts#show
  #posts GET    /posts(.:format)          posts#index
  #DELETE /posts/:id(.:format)      posts#destroy
  
  #Tutorial thingy seems to want me to add all of the above, but
  # none of them seem to be formatted in a way the editor 'likes' so to speak.
  
  root to: "welcome#index"
end

