Rails.application.routes.draw do
  root 'posts#index'
  get 'posts/index', to: 'posts#index'
  get 'posts/new', to: 'posts#new'
  get 'posts/:id', to: 'posts#show'
  get 'posts/:id/edit', to: 'posts#edit'
  post 'posts/create', to: 'posts#create'
  patch 'posts/:id/edit', to: 'posts#update'
  get 'posts/delete/:id', to: 'posts#delete'

  resources :posts
end
