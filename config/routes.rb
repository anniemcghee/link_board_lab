Rails.application.routes.draw do

  get '/' => 'posts#home'

  resources :posts

  get "signup" => "users#new"
  post "signup" => "users#create"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy"
  post "logout" => "sessions#destroy"

#    Prefix Verb   URI Pattern               Controller#Action
#     posts GET    /posts(.:format)          posts#index
#           POST   /posts(.:format)          posts#create
#  new_post GET    /posts/new(.:format)      posts#new
# edit_post GET    /posts/:id/edit(.:format) posts#edit
#      post GET    /posts/:id(.:format)      posts#show
#           PATCH  /posts/:id(.:format)      posts#update
#           PUT    /posts/:id(.:format)      posts#update
#           DELETE /posts/:id(.:format)      posts#destroy
#    signup GET    /signup(.:format)         users#new
#           POST   /signup(.:format)         users#create
#     login GET    /login(.:format)          sessions#new
#           POST   /login(.:format)          sessions#create
#    logout GET    /logout(.:format)         sessions#destroy
#           POST   /logout(.:format)         sessions#destroy
end
