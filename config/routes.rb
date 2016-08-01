Rails.application.routes.draw do
  # resources :users
  get 'users/' => 'users#index'
  get 'users/:id' => 'users#show'
  post 'users/' => 'users#create'
  patch 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'
  put 'users/:id' => 'users#update'
  get 'users/new' => 'users#new'
  get 'users/:id/edit' => 'users#edit'

end
